# B. Kießling
# Challenge 5: Visualisierung von Stadtteilsdaten
# Achtung: Die Challenge hat keinen Code zum überprüfen aber dafür eine Plot als png wie euer Ergebnis aussehen sollte

# Dot-Plot über das Verhältnis von Einkünften und Wohnungsgröße

# 1. Lade den Datensatz StadtteilprofileBerichtsjahr2017.xlsx und speichere ihn im Objekt stadtteile
# Anmerkung: In den aktuelleren Datensätzen sind die Einkünfte leider nicht aufgelistet 
# Tipp: das Argument skip als Teil der Funktion read_xlsx könnte sehr hilfreich sein - ?read_xlsx
# Tipp: Nutze die Funktion clean_names() aus dem Janitor Package, sodass du saubere Colnames erhältst - ??clean_names()

# 2. Selektiere die Columns:
     # x1
     # gesamtbetrag_der_einkunfte_je_steuerpflichtigen_lohn_und_einkommen_steuer_im_jahr
     # durchschnittliche_wohnungsgrosse_in_m2
     # durchschnittlicher_immobilienpreis_fur_eine_eigentums_wohnung_in_eur_m2 

# 3. Nenne die columns in stadtteil, einkommen, wohnungsgroesse, kaufpreis_m2 mit der Funktion rename() um - rename(new_name = old_name)

# 4. Erstelle ein Dot-Plot mit dem Einkommen auf der x-Achse und der Wohnungsgröße auf der y-Achse

# 5. Nutze das Mapping-Argument color für den kaufpreis_m2

# 5. Beschrifte die Achsen, gebe dem Plot einen Titel und Beschrifte die Legende - labs(color = "text")

# 6. Beschreibe mit einem Satz, was dir bei der Interpretation der Daten auffällt und committe diesen mit deinen Ergebnissen

#libraries

library(dplyr)
library(purrr)
library(readxl)
library(tidyr)
library(ggplot2)
library(janitor)


#load & modify Data
stadtteil = read_excel("data/StadtteilprofileBerichtsjahr2017.xlsx", skip = 3) %>%
  clean_names()

stadtteil = stadtteil %>% 
  rename(stadtteil = x1)

stadtteil = stadtteil %>% 
  select(stadtteil, gesamtbetrag_der_einkunfte_je_steuerpflichtigen_lohn_und_einkommen_steuer_im_jahr, durchschnittliche_wohnungsgrosse_in_m2, durchschnittlicher_immobilienpreis_fur_eine_eigentums_wohnung_in_eur_m2) %>% 
  rename(einkommen = gesamtbetrag_der_einkunfte_je_steuerpflichtigen_lohn_und_einkommen_steuer_im_jahr) %>% 
  rename(wohnungsgroesse = durchschnittliche_wohnungsgrosse_in_m2) %>% 
  rename(kaufpreis_m2 = durchschnittlicher_immobilienpreis_fur_eine_eigentums_wohnung_in_eur_m2)

#plot Data
ggplot(data = stadtteil, aes(x=wohnungsgroesse, y=einkommen, color=kaufpreis_m2))+
  geom_point()+
  ggtitle("Vergleich der Wohnfläche und dem Einkommen")+
  ylab("Einkommen in €")+
  xlab("Größe der Wohnung in m2")+
  labs(color = "Kaufpreis pro m2")


