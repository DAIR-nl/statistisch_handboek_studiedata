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
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                            ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    "01 One sample t-toets",                           "1",          "1",       "1",               "1",       
    "02 Gepaarde t-toets",                             "1",          "1",       "1",               "0",       
    "03 Ongepaarde t-toets",                           "1",          "1",       "1",               "0",       
    "04 Repeated measures ANOVA",                      "0",          "0",       "0",               "0",       
    "05 One-way ANOVA",                                "1",          "0",       "1",               "0",       
    "06 Tekentoets",                                   "1",          "0",       "0",               "0",       
    "07 Wilcoxon signed rank toets",                   "0",          "0",       "0",               "0",       
    "08 Mann-Whitney U toets",                         "1",          "0",       "1",               "0",       
    "09 Friedmans ANOVA",                              "0",          "0",       "0",               "0",       
    "10 Kruskal Wallis toets",                         "1",          "0",       "1",               "0",       
    "11 Chi-kwadraat toets en binomiaaltoets",         "0",          "0",       "0",               "0",       
    "12 McNemar toets",                                "0",          "0",       "0",               "0",       
    "13 Chi-kwadraat toets en Fishers exact toets",    "1",          "0",       "1",               "0",       
    "14 NIET IN GEBRUIK; NIET VERWIJDEREN",            "0",          "0",       "0",               "0",       
    "15 Cochrans Q toets",                             "0",          "0",       "0",               "0",       
    "16 Fisher-Freeman-Halton exact toets",            "0",          "0",       "0",               "0",       
    "17 McNemar toets en Wilcoxon signed rank toets",  "0",          "0",       "0",               "0",      
    "18 Chi-kwadraat toets trend",                     "0",          "0",       "0",               "0",       
    "19 GLMM GLEE",                                    "0",          "0",       "0",               "0",       
)