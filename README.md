# [SQL] Ecommerce Datensatz untersuchen
## I. Einleitung
Dieses Projekt enthält einen E-Commerce-Datensatz, den ich mithilfe von SQL auf [Google BigQuery](https://cloud.google.com/bigquery) untersuchen werde. Der Datensatz basiert auf dem öffentlichen Google Analytics-Datensatz und enthält Daten von einer E-Commerce-Website.
## II. Voraussetzungen
* [Google Cloud Platform-Konto](https://cloud.google.com)
* Projekt auf der Google Cloud Platform
* [Google BigQuery API](https://cloud.google.com/bigquery/docs/enable-transfer-service#:~:text=Enable%20the%20BigQuery%20Data%20Transfer%20Service,-Before%20you%20can&text=Open%20the%20BigQuery%20Data%20Transfer,Click%20the%20ENABLE%20button.) aktiviert
* [SQL-Abfrage-Editor](https://cloud.google.com/monitoring/mql/query-editor) oder IDE
## III. Zugriff auf den Datensatz
Der E-Commerce-Datensatz ist in einem öffentlichen Google BigQuery-Datensatz gespeichert. Befolgen Sie diese Schritte, um auf den Datensatz zuzugreifen:
* Melden Sie sich bei Ihrem Google Cloud Platform-Konto an und erstellen Sie ein neues Projekt.
* Navigieren Sie zur BigQuery-Konsole und wählen Sie Ihr neu erstelltes Projekt aus.
* Wählen Sie im Navigationsbereich "Add Data" (Daten hinzufügen) und dann "Search a project" (Ein Projekt suchen).
* Geben Sie die Projekt-ID **"bigquery-public-data.google_analytics_sample.ga_sessions"** ein und drücken Sie "Enter".
* Klicken Sie auf die Tabelle **"ga_sessions_"**, um sie zu öffnen.
## IV. Untersuchung des Datensatzes
In diesem Projekt werde ich 08 Abfragen in BigQuery basierend auf dem Google Analytics-Datensatz schreiben.
### Abfrage 01: Berechnen Sie die gesamten Besuche, Seitenaufrufe, Transaktionen und den Umsatz für Januar, Februar und März 2017, sortiert nach Monat
* SQL-Code

<img width="713" height="183" alt="q1" src="https://github.com/user-attachments/assets/e23179df-c34c-4f00-aa98-81fa36171bda" />


* Abfrageergebnisse

<img width="832" height="152" alt="r1" src="https://github.com/user-attachments/assets/0b5f32f5-4d56-49c4-a647-feb3654cac88" />


### Abfrage 02: Absprungrate pro Zugriffsquelle im Juli 2017
* SQL-Code

<img width="717" height="231" alt="q2" src="https://github.com/user-attachments/assets/37d35b0f-ace9-404c-b1ca-c86e1f49ce46" />


* Abfrageergebnisse

<img width="867" height="406" alt="r2" src="https://github.com/user-attachments/assets/a7299547-f948-4a8e-9079-fae261249b6a" />


### Abfrage 3: Umsatz nach Zugriffsquelle nach Woche und nach Monat im Juni 2017
* SQL-Code

<img width="747" height="506" alt="q3" src="https://github.com/user-attachments/assets/ed7ca3bd-7eb0-4e3c-80ff-39e13df2ac59" />


* Abfrageergebnisse

<img width="992" height="402" alt="r3" src="https://github.com/user-attachments/assets/b6260cd8-812a-4cd2-b1b2-f80d34d2898a" />

### Abfrage 04: Konversionsrate nach Zugriffsquelle im Jahr 2017. (sortiert nach conversion_rate desc)
* SQL-Code

<img width="837" height="190" alt="q4" src="https://github.com/user-attachments/assets/44ce8df7-539b-464a-9329-2cae71ff4cf9" />


* Abfrageergebnisse

<img width="827" height="145" alt="r4" src="https://github.com/user-attachments/assets/1f694c9e-4811-470c-adb2-2967b69130d0" />

### Abfrage 05: Durchschnittliche Anzahl von Seitenaufrufen nach Käufertyp (Käufer vs. Nicht-Käufer) im Juni und Juli 2017
* SQL-Code

<img width="882" height="570" alt="q5" src="https://github.com/user-attachments/assets/1ac7e52a-2ab2-4ff5-9803-01f4ae7b62f0" />


* Abfrageergebnisse

<img width="675" height="112" alt="r5" src="https://github.com/user-attachments/assets/091b11d0-5fc9-4912-8872-ee8c172b9f64" />

### Abfrage 06: Durchschnittliche Anzahl von Transaktionen pro Nutzer, der im Juli 2017 einen Kauf getätigt hat
* SQL-Code

<img width="917" height="190" alt="q6" src="https://github.com/user-attachments/assets/747b3760-cc44-4a72-9025-7dc0908a963b" />

* Abfrageergebnisse

<img width="488" height="71" alt="r6" src="https://github.com/user-attachments/assets/2fb113b8-9d30-4fb6-8ba0-66a6735edd9b" />

### Abfrage 07: Umsatzbeitrag nach Gerät im Jahr 2017 (sortiert nach ratio desc)
* SQL-Code

<img width="827" height="306" alt="q7" src="https://github.com/user-attachments/assets/f7e12e1d-c67e-4d06-b0f7-bb4f832ff028" />

* Abfrageergebnisse

<img width="802" height="151" alt="r7" src="https://github.com/user-attachments/assets/23edae55-986a-4611-8462-2f41315ff99a" />

### Abfrage 08: Andere Produkte, die von Kunden gekauft wurden, die das Produkt "YouTube Men's Vintage Henley" im Juli 2017 gekauft haben
* SQL-Code

<img width="737" height="427" alt="q8" src="https://github.com/user-attachments/assets/76b8fb32-0dd2-4929-aed3-2ce3154c4e7a" />


* Abfrageergebnisse

<img width="510" height="422" alt="r8" src="https://github.com/user-attachments/assets/e2020662-9435-4a2e-a670-58db4aab57af" />


### Abfrage 09: Kohortenkarte vom Produktaufruf (product view) zum Hinzufügen zum Warenkorb (addtocart) bis zum Kauf (purchase) für Januar, Februar und März 2017 berechnen
* SQL-Code

<img width="1013" height="427" alt="q9" src="https://github.com/user-attachments/assets/0fe003a4-33eb-409d-90f6-11b93db4bd7b" />

* Abfrageergebnisse

<img width="1141" height="151" alt="r9" src="https://github.com/user-attachments/assets/c738c19d-22c7-461f-8ae3-76b4f6ebbbe2" />


### Abfrage 10: Umsatz nach Woche von Mai bis Juli 2017 und kumulierten Umsatz berechnen
* SQL-Code

<img width="766" height="372" alt="q10" src="https://github.com/user-attachments/assets/3cea11a5-1b23-47e1-9160-3b8e5f56b061" />

* Abfrageergebnisse

<img width="651" height="402" alt="r10" src="https://github.com/user-attachments/assets/ccc58703-bc4b-4627-99f3-9939db91f3fb" />


## V. Fazit
* Zusammenfassend hat meine Untersuchung des E-Commerce-Datensatzes mithilfe von SQL in Google BigQuery basierend auf dem Google Analytics-Datensatz mehrere interessante Erkenntnisse geliefert.
* Durch die Untersuchung des E-Commerce-Datensatzes habe ich wertvolle Informationen über Gesamtbesuche, Seitenaufrufe, Transaktionen, Absprungraten und Umsätze pro Zugriffsquelle gewonnen..., die zukünftige Geschäftsentscheidungen fundieren könnten.
* Um tiefer in die Erkenntnisse und wichtigsten Trends einzutauchen, besteht der nächste Schritt darin, die Daten mit Software wie Power BI, Tableau,... zu visualisieren.
* **Insgesamt** hat dieses Projekt gezeigt, wie leistungsfähig der Einsatz von SQL und Big-Data-Tools wie Google BigQuery ist, um Einblicke in große Datensätze zu gewinnen.
