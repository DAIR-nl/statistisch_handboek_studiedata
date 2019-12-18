* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=Cijfer
  /STATISTICS=MEAN STDDEV.

IF  (Voor_of_na_tutorgesprek = 1) Tentamencijfer_voor_tutorgesprek=Cijfer.
EXECUTE.

IF  (Voor_of_na_tutorgesprek = 2) Tentamencijfer_na_tutorgesprek=Cijfer.
EXECUTE.

GRAPH
  /HISTOGRAM=Tentamencijfer_voor_tutorgesprek.

GRAPH
  /HISTOGRAM=Tentamencijfer_na_tutorgesprek.

PPLOT
  /VARIABLES=Tentamencijfer_voor_tutorgesprek Tentamencijfer_na_tutorgesprek
  /NOLOG
  /NOSTANDARDIZE
  /TYPE=Q-Q
  /FRACTION=BLOM
  /TIES=MEAN
  /DIST=NORMAL.

EXAMINE VARIABLES=Cijfer BY Voor_of_na_tutorgesprek
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.

NPAR TESTS
  /K-S(NORMAL)=Tentamencijfer_voor_tutorgesprek Tentamencijfer_na_tutorgesprek
  /MISSING ANALYSIS.


T-TEST PAIRS=Tentamencijfer_voor_tutorgesprek WITH Tentamencijfer_na_tutorgesprek (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
