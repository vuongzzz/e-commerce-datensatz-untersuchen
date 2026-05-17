--f1: Berechnen Sie die gesamten Besuche, Seitenaufrufe, Transaktionen und den Umsatz für Januar, Februar und März 2017, sortiert nach Monat

SELECT
  format_date("%Y%m", parse_date("%Y%m%d", date)) as month,
  SUM(totals.visits) AS visits,
  SUM(totals.pageviews) AS pageviews,
  SUM(totals.transactions) AS transactions,
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
WHERE _TABLE_SUFFIX BETWEEN '0101' AND '0331'
GROUP BY 1
ORDER BY 1;

--f2: Absprungrate pro Zugriffsquelle im Juli 2017

with bounce_data as(
  SELECT distinct trafficSource.source
        ,sum(totals.visits) as total_visit
        ,sum(totals.bounces) as total_no_of_bounce
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*` 
  group by 1
  order by 2 desc
)
select *
      ,round(100.0*total_no_of_bounce/total_visit,3)
from bounce_data;

--f3: Umsatz nach Zugriffsquelle nach Woche und nach Monat im Juni 2017

(
  SELECT 'Week' as time_type
        ,FORMAT_DATE('%G%V', PARSE_DATE('%Y%m%d', date)) AS time
        ,trafficSource.`source` as source
        ,round(sum(product.productRevenue/1000000),4) as revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
  where product.productRevenue is not null
  group by 2,3
  order by 1,2,3
)
union all
(
  select 'Month' as time_type
        ,LEFT(date, 6) AS month
        ,trafficSource.`source` as source
        ,round(sum(product.productRevenue/1000000),4) as revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
  where product.productRevenue is not null
  group by 2,3
  order by 1,2,3
);

--f4: Konversionsrate nach Zugriffsquelle im Jahr 2017. (sortiert nach conversion_rate desc)

SELECT
  trafficSource.source,
  sum(totals.visits) visits,
  SUM(totals.transactions) AS transactions,
  round((SUM(totals.transactions)/ sum(totals.visits)),2) * 100.00 AS conversion_rate
FROM  `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
GROUP BY source
having SUM(totals.transactions) >= 50
ORDER BY conversion_rate DESC;

--f5: Durchschnittliche Anzahl von Seitenaufrufen nach Käufertyp (Käufer vs. Nicht-Käufer) im Juni und Juli 2017

with purchaser_data as (
      select LEFT(date, 6) AS month
            ,sum(totals.pageviews) as total_pageview_purchaser
            ,count(distinct fullVisitorId) as purchaser
      FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
      UNNEST (hits) hits,
      UNNEST (hits.product) product
      where _table_suffix between '0601' and '0731'
            and totals.transactions >= 1 and product.productRevenue is not null
      group by 1
)
, non_purchaser_data as(
      select LEFT(date, 6) AS month
            ,sum(totals.pageviews) as total_pageview_non_purchaser
            ,count(distinct fullVisitorId) as non_purchaser
      FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
      UNNEST (hits) hits,
      UNNEST (hits.product) product
      where _table_suffix between '0601' and '0731'
            and totals.transactions is null and product.productRevenue is null
      group by 1
)
select purchaser_data.month
      ,round(total_pageview_purchaser/purchaser,2) as avg_pageviews_purchase
      ,round(total_pageview_non_purchaser/non_purchaser,2) as avg_pageviews_non_purchase
from purchaser_data
left join non_purchaser_data using(month)
order by 1;

--f6: Durchschnittliche Anzahl von Transaktionen pro Nutzer, der im Juli 2017 einen Kauf getätigt hat

select
    format_date("%Y%m",parse_date("%Y%m%d",date)) as month,
    sum(totals.transactions)/count(distinct fullvisitorid) as Avg_total_transactions_per_user
from `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
    ,unnest (hits) hits,
    unnest(product) product
where  totals.transactions>=1
and product.productRevenue is not null
group by month;

--f7: Umsatzbeitrag nach Gerät im Jahr 2017 (sortiert nach ratio desc)

with rev_dev as (
  SELECT distinct device.deviceCategory as device
        ,round(sum(product.productRevenue)/1000000,2) as revenue_by_device
        ,sum(round(sum(product.productRevenue)/1000000,2)) over() as total_revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
  where totals.transactions is not null 
        and product.productRevenue is not null
  group by 1
)
select *
      ,round(100.0*revenue_by_device/total_revenue,2) as ratio
from rev_dev
order by ratio desc;

--f8: Andere Produkte, die von Kunden gekauft wurden, die das Produkt "YouTube Men's Vintage Henley" im Juli 2017 gekauft haben

with ytb_purchaser as(
  select distinct fullVisitorId as ytb_purchased
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
  where product.v2ProductName = "YouTube Men's Vintage Henley"
        and product.productRevenue is not null  
        and totals.transactions >=1)

select product.v2ProductName
      ,sum(product.productQuantity)
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
where fullVisitorId in (select ytb_purchased
                        from ytb_purchaser)
      and product.productRevenue is not null  
      and totals.transactions >=1
      and product.v2ProductName <> "YouTube Men's Vintage Henley"
group by 1
order by 2 desc;

--f9: Kohortenkarte vom Produktaufruf (product view) zum Hinzufügen zum Warenkorb (addtocart) bis zum Kauf (purchase) für Januar, Februar und März 2017 berechnen

with product_data as(
select
    format_date('%Y%m', parse_date('%Y%m%d',date)) as month,
    count(CASE WHEN eCommerceAction.action_type = '2' THEN product.v2ProductName END) as num_product_view,
    count(CASE WHEN eCommerceAction.action_type = '3' THEN product.v2ProductName END) as num_add_to_cart,
    count(CASE WHEN eCommerceAction.action_type = '6' and product.productRevenue is not null THEN product.v2ProductName END) as num_purchase
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
,UNNEST(hits) as hits
,UNNEST (hits.product) as product
where _table_suffix between '20170101' and '20170331'
and eCommerceAction.action_type in ('2','3','6')
group by month
order by month
)

select
    *,
    round(num_add_to_cart/num_product_view * 100, 2) as add_to_cart_rate,
    round(num_purchase/num_product_view * 100, 2) as purchase_rate
from product_data;

--f10: Umsatz nach Woche von Mai bis Juli 2017 und kumulierten Umsatz berechnen

WITH week_only AS (
  SELECT 
    FORMAT_DATE('%G%V', PARSE_DATE('%Y%m%d', date)) AS week,
    ANY_VALUE(LEFT(date, 6)) AS month_label, 
    SUM(product.productRevenue) / 1000000 AS weekly_revenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,
  UNNEST(hits) AS hits,
  UNNEST(hits.product) AS product
  WHERE product.productRevenue IS NOT NULL
  GROUP BY 1
)
SELECT 
      week,
      ROUND(weekly_revenue, 2) AS weekly_revenue,
      ROUND(SUM(weekly_revenue) OVER(ORDER BY week), 2) AS cumulative_revenue
FROM week_only
WHERE month_label BETWEEN '201705' AND '201707'
ORDER BY week;