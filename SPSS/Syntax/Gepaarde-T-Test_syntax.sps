* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
DESCRIPTIVES VARIABLES=Cijfer
  /STATISTICS=MEAN STDDEV.

IF  (Voor_of_na_tutorgesprek = 1) Tentamencijfer_voor_tutorgesprek=Cijfer.
EXECUTE.

IF  (Voor_of_na_tutorgesprek = 1) Tentamencijfer_voor_tutorgesprek=Cijfer.
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
