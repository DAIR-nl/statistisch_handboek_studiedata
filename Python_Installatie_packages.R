## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Python_Installatie_packages.R ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## R code voor Student Analytics Vrije Universiteit Amsterdam
## Copyright 2021 VU
## Web Page: http://www.vu.nl
## Contact: Theo Bakker (t.c.bakker@vu.nl)
## Verspreiding buiten de VU: Nee
##
## Doel: Een script om Python packages te installeren
##
## Afhankelijkheden: 
##
## Datasets: 
##
## Opmerkingen:
## 1) Geen.
## 2) ___
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## TODO:
## 1) ___.
##
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Geschiedenis:
## 09-03-2021: EG: Aanmaak bestand
## 09-03-2021: EG: Bijwerken en inhoudelijke verduidelijking
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Toelichting: in dit script worden alle Python packages die nodig zijn voor
## de Python toetspagina's geïnstalleerd. Er is ook code waarmee Python en 
## miniconda gedownload kunnen worden. Dit deel van de code is sterk afhankelijk
## van de gebruiker, aangezien het gaat over mappen waarin Python opgeslagen is.
## De code moet dus door nieuwe gebruikers aangepast worden. Zodra er een nieuw
## package gedownload moet worden, wordt dit hier bijgehouden.

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 1. PYTHON INSTALLEREN ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Laad het package reticulate dat ervoor zorgt dat vanuit R Python scripts
## gerund kunnen worden en dat er interactie is tussen R en Python.
library(reticulate)

## Indien nodig: installeer miniconda
#reticulate::install_miniconda()

## Onderzoek waar er versies van Python op de pc staan. Het kan namelijk dat er
## meerdere Python versies aanwezig zijn of versies in verschillende mappen
py_discover_config()

## Sla het pad van de versie van Python op
Pad <- py_discover_config()

## Stel in dat deze versie van Python gebruikt wordt
use_python(Pad$python)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 2. INSTALLEER PACKAGES ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## In dit deel worden de Python packages geïnstalleerd. Als er een nieuw
## package gebruikt wordt in een toetspagina, moet deze hier geïnstalleerd 
## worden.

py_install("pandas")
py_install("matplotlib")
py_install("scipy")
py_install("statsmodels")
py_install("pingouin")
py_install("seaborn")
py_install("scikit-posthocs", pip = TRUE)
py_install("FisherExact", pip = TRUE)

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## 3. LINKS MET INFORMATIE OVER PACKAGES ####
## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# https://github.com/rstudio/reticulate/issues/578
# https://cran.r-project.org/web/packages/reticulate/vignettes/python_packages.html
# https://seaborn.pydata.org/generated/seaborn.FacetGrid.html (Seaborn)
# https://scikit-posthocs.readthedocs.io/en/latest/posthocs_api/ (post-hoc tests)
# https://www.statsmodels.org/stable/api.html#statsmodels-api (statsmodels)
# https://tedboy.github.io/statsmodels_doc/generated/statsmodels.stats.api.html (statsmodels.api)
# https://pingouin-stats.org/index.html (pingouin)
# https://docs.scipy.org/doc/scipy/reference/stats.html (scipy)
# https://pypi.org/project/met/
# https://stackoverflow.com/questions/53159043/multinomial-test-in-python-with-met-module
# https://pythonhosted.org/met/#:~:text=met%20%2D%2D%20Multinomial%20Exact%20Tests&text=met.py%20is%20a%20Python,to%20the%20'control'%20distribution.
# https://stackoverflow.com/questions/53159043/multinomial-test-in-python-with-met-module
# https://peterstatistics.com/CrashCourse/4-TwoVarPair/NomNom/NomNomPair3.html
# https://www.statsmodels.org/devel/generated/statsmodels.stats.contingency_tables.Table2x2.homogeneity.html
# https://www.statsmodels.org/stable/contingency_tables.html
