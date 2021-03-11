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
## 11-03-2021: EG: Toelichting toegevoegd
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: In dit script wordt een overzicht gemaakt van welke
## toetspagina's wel of niet op de site aanwezig zijn. Dit script wordt gebruikt
## door het script Index_Sitemap.R in de map SHHO om een sitemap aan te maken.
## Voor meer informatie over de sitemap, zie de toelichting in het script
## Index_Sitemap.R . De aanpak in dit script is als volgt:

## Maak een lijst met alle toetsen waarvoor een html-toetspagina gemaakt moet
## worden voor op de website. De rijen zijn gelijk aan alle toetspagina's die er
## zijn. De kolommen bestaan uit ~InGebruik_R, ~Review_R, ~InGebruik_Python en 
## ~Review_Python. Geef voor de kolom ~InGebruik_R met een 1 aan dat voor die
## toets een html-document gemaakt moet worden en met 0 aan dat dit niet hoeft.
## Dit geldt hetzelfde voor ~InGebruik_Python. Geef in de kolom ~Review_R aan
## met een 1 dat de toetspagina al door alle reviewrondes heen is gegaan en met
## een 0 aan dat dit niet zo is. Als de toetspagina nog niet door alle review-
## rondes heen is, komt er bovenaan de html-toetspagina een disclaimer te staan.
## Voor de kolom ~Review_Python geldt weer hetzelfde. Let dus op dat bij een 
## nieuwe toets de lijst dus gewijzigd moet worden.

## Dit overzicht wordt ook gemaakt in het bestand Index_Render_site.R uit de map 
## SHHO . Het is daarom belangrijk om op te letten dat het
## overzicht met toetsen in het script Index_Render_site.R en het overzicht in
## Toetsen.R (dit script) hetzelfde is. Houdt dit bij en ga dit na.


## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 01 BEPAAL WELKE TOETSEN GEMAAKT MOETEN WORDEN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Bepaal de lijst van toetsen; wijzig 0 in 1 om in gebruik te nemen
dfToetsen <- tribble(
    ~Toets,                                                                              ~InGebruik_R, ~Review_R, ~InGebruik_Python, ~Review_Python,
    "01 One sample t-toets",                                                                  "1",          "1",       "1",               "1",       
    "02 Gepaarde t-toets",                                                                    "1",          "1",       "1",               "0",       
    "03 Ongepaarde t-toets",                                                                  "1",          "1",       "1",               "0",       
    "04 Repeated measures ANOVA",                                                             "1",          "0",       "1",               "0",       
    "05 One-way ANOVA",                                                                       "1",          "0",       "1",               "0",       
    "06 Tekentoets I",                                                                        "1",          "0",       "1",               "0",       
    "07 Wilcoxon signed rank toets I",                                                        "1",          "0",       "1",               "0",       
    "08 Mann-Whitney U toets I",                                                              "1",          "0",       "1",               "0",       
    "09 Friedmans ANOVA I",                                                                   "1",          "0",       "1",               "0",       
    "10 Kruskal Wallis toets I",                                                              "1",          "0",       "1",               "0",       
    "11 Chi-kwadraat toets voor goodness of fit en binomiaaltoets",                           "1",          "0",       "1",               "0",       
    "12 McNemar toets",                                                                       "1",          "0",       "1",               "0",       
    "13 Chi-kwadraat toets voor onafhankelijkheid en Fishers exacte toets",                   "1",          "0",       "1",               "0",       
    "14 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "15 Cochrans Q toets",                                                                    "1",          "0",       "1",               "0",       
    "16 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets I",   "1",          "0",       "1",               "0",       
    "17 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                        "0",          "0",       "0",               "0",       
    "18 Bhapkar toets",                                                                       "1",          "0",       "1",               "0",      
    "19 Chi-kwadraat toets voor onafhankelijkheid en Fisher-Freeman-Halton exacte toets II",  "0",          "0",       "0",               "0",       
    "20 Multilevel multinomiale logistische regressie",                                       "1",          "0",       "0",               "0",       
    "21 Chi-kwadraat toets voor goodness of fit en multinomiaaltoets",                        "1",          "0",       "1",               "0",       
    "22 Wilcoxon signed rank toets II",                                                       "1",          "0",       "0",               "0",       
    "23 Mann-Whitney U toets II",                                                             "1",          "0",       "0",               "0",       
    "24 Friedmans ANOVA II",                                                                  "1",          "0",       "0",               "0",       
    "25 Kruskal Wallis toets II",                                                             "1",          "0",       "0",               "0",       
    "26 Tekentoets II",                                                                       "1",          "0",       "0",               "0",       
    "27 Moods mediaan toets",                                                                 "1",          "0",       "0",               "0",       

        ## Toetsmatrix II
    ## Toetsmatrix II
    "28 Multipele lineaire regressie",                                                        "1",          "0",       "0",               "0",       
    "29 Factoriele ANOVA",                                                                    "1",          "0",       "0",               "0",       
    "30 Factoriele repeated measures ANOVA",                                                  "1",          "0",       "0",               "0",       
    "31 ANCOVA",                                                                              "1",          "0",       "0",               "0",       
    "32 Mixed ANOVA",                                                                         "1",          "0",       "0",               "0",       
    "33 Multilevel lineaire regressie I",                                                     "0",          "0",       "0",               "0",       
    "34 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "35 Multilevel lineaire regressie II",                                                    "0",          "0",       "0",               "0",       
    "36 Survival analyse",                                                                    "0",          "0",       "0",               "0",       
    "37 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "38 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "39 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "40 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "41 Logistische regressie",                                                               "1",          "0",       "0",               "0",       
    "42 Loglineaire analyse",                                                                 "0",          "0",       "0",               "0",       
    "43 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "44 Multilevel logistische regressie I",                                                  "0",          "0",       "0",               "0",       
    "45 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "46 Multilevel logistische regressie II",                                                 "0",          "0",       "0",               "0",       
    "47 Multinomiale logistische regressie",                                                  "1",          "0",       "0",               "0",       
    "48 Loglineaire analyse",                                                                 "0",          "0",       "0",               "0",       
    "49 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "50 Multilevel multinomiale logistische regressie I",                                     "0",          "0",       "0",               "0",       
    "51 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "52 Multilevel multinomiale logistische regressie II",                                    "0",          "0",       "0",               "0",       
    "53 Ordinale logistische regressie",                                                      "1",          "0",       "0",               "0",       
    "54 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "55 Multilevel ordinale logistische regressie I",                                         "0",          "0",       "0",               "0",       
    "56 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "57 Multilevel ordinale logistische regressie II",                                        "0",          "0",       "0",               "0",       
    "58 MANOVA",                                                                              "1",          "0",       "0",               "0",       
    "59 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "60 MANCOVA",                                                                             "0",          "0",       "0",               "0",       
    "61 LEEG; NIET VERWIJDEREN",                                                              "0",          "0",       "0",               "0",       
    "62 ",                                                                                    "0",          "0",       "0",               "0",       
)
