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

code câu 1

* Abfrageergebnisse

kq câu 1

### Abfrage 02: Absprungrate pro Zugriffsquelle im Juli 2017
* SQL-Code

code 2

* Abfrageergebnisse

kq 2

### Abfrage 3: Umsatz nach Zugriffsquelle nach Woche und nach Monat im Juni 2017
* SQL-Code

code 3

* Abfrageergebnisse

kq 3

### Abfrage 04: Durchschnittliche Anzahl von Produktseitenaufrufen nach Käufertyp (Käufer vs. Nicht-Käufer) im Juni und Juli 2017
* SQL-Code

code 4

* Abfrageergebnisse

kq 4

### Abfrage 05: Durchschnittliche Anzahl von Transaktionen pro Nutzer, der im Juli 2017 einen Kauf getätigt hat
* SQL-Code

code 5

* Abfrageergebnisse

kq 5

### Abfrage 06: Durchschnittlich ausgegebener Geldbetrag pro Sitzung. Nur Käuferdaten für Juli 2017 einbeziehen
* SQL-Code

code 6

* Abfrageergebnisse

kq 6

### Abfrage 07: Andere Produkte, die von Kunden gekauft wurden, die das Produkt "YouTube Men's Vintage Henley" im Juli 2017 gekauft haben. Die Ausgabe sollte den Produktnamen und die bestellte Menge anzeigen.
* SQL-Code

code 7

* Abfrageergebnisse

kq 7

### Abfrage 08: Kohortenkarte vom Seitenaufruf (pageview) zum Hinzufügen zum Warenkorb (addtocart) bis zum Kauf (purchase) für die letzten 3 Monate berechnen.
* SQL-Code

* Abfrageergebnisse

code 8

## V. Fazit
* Zusammenfassend hat meine Untersuchung des E-Commerce-Datensatzes mithilfe von SQL in Google BigQuery basierend auf dem Google Analytics-Datensatz mehrere interessante Erkenntnisse geliefert.
* Durch die Untersuchung des E-Commerce-Datensatzes habe ich wertvolle Informationen über Gesamtbesuche, Seitenaufrufe, Transaktionen, Absprungraten und Umsätze pro Zugriffsquelle gewonnen..., die zukünftige Geschäftsentscheidungen fundieren könnten.
* Um tiefer in die Erkenntnisse und wichtigsten Trends einzutauchen, besteht der nächste Schritt darin, die Daten mit Software wie Power BI, Tableau,... zu visualisieren.
* **Insgesamt** hat dieses Projekt gezeigt, wie leistungsfähig der Einsatz von SQL und Big-Data-Tools wie Google BigQuery ist, um Einblicke in große Datensätze zu gewinnen.
