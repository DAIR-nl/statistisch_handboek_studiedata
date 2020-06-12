## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Toetsen.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor het Statistisch Handboek van het Versnellingsplan
## Copyright 2020 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
##
## Doel: Overzicht van toetsen en hun status
##
## Afhankelijkheden: Geen
##
## Datasets: Geen
##
## Opmerkingen: 
## 1) Geen.
## 2) ___
##
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 23-02-2020: TB: Aanmaak bestand
## 11-06-2020: EG: Wijzigen toetsen tibble
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                                                              ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    "01 One sample t-toets",                                                                  "1",          "1",       "1",               "1",       
    "02 Gepaarde t-toets",                                                                    "1",          "1",       "1",               "0",       
    "03 Ongepaarde t-toets",                                                                  "1",          "1",       "1",               "0",       
    "04 Repeated measures ANOVA",                                                             "1",          "0",       "0",               "0",       
    "05 One-way ANOVA",                                                                       "1",          "0",       "1",               "0",       
    "06 Tekentoets I",                                                                        "1",          "0",       "0",               "0",       
    "07 Wilcoxon signed rank toets I",                                                        "1",          "0",       "0",               "0",       
    "08 Mann-Whitney U toets I",                                                              "1",          "0",       "1",               "0",       
    "09 Friedmans ANOVA I",                                                                   "1",          "0",       "0",               "0",       
    "10 Kruskal Wallis toets I",                                                              "1",          "0",       "1",               "0",       
    "11 Chi-kwadraat toets voor goodness of fit en binomiaaltoets",                           "1",          "0",       "0",               "0",       
    "12 McNemar toets I",                                                                     "1",          "0",       "0",               "0",       
    "13 Chi-kwadraat toets voor onafhankelijkheid en Fishers exact toets",                    "1",          "0",       "1",               "0",       
    "14 NIET IN GEBRUIK; NIET VERWIJDEREN",                                                   "0",          "0",       "0",               "0",       
    "15 Cochrans Q toets",                                                                    "1",          "0",       "0",               "0",       
    "16 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets I",    "1",          "0",       "0",               "0",       
    "17 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                        "0",          "0",       "0",               "0",       
    "18 McNemar toets II",                                                                    "0",          "0",       "0",               "0",      
    "19 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets II",   "0",          "0",       "0",               "0",       
    "20 Multilevel multinomiale logistische regressie",                                       "1",          "0",       "0",               "0",       
    "21 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exact toets III",  "0",          "0",       "0",               "0",       
    "22 Wilcoxon signed rank toets II",                                                       "0",          "0",       "0",               "0",       
    "23 Mann-Whitney U toets II",                                                             "0",          "0",       "0",               "0",       
    "24 Friedmans ANOVA II",                                                                  "0",          "0",       "0",               "0",       
    "25 Kruskal Wallis toets II",                                                             "0",          "0",       "0",               "0",       
    "26 Tekentoets II",                                                                       "1",          "0",       "0",               "0",       
    "27 Moods mediaan toets",                                                                "1",          "0",       "0",               "0",       
)