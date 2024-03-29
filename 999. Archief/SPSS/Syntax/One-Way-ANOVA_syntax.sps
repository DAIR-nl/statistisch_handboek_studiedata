﻿* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.

DESCRIPTIVES VARIABLES=Reistijd
  /STATISTICS=MEAN STDDEV MIN MAX.

IF  (Opleiding = 1) Reistijd_ATC=Reistijd.
EXECUTE.

IF  (Opleiding = 2) Reistijd_FIL=Reistijd.
EXECUTE.

IF  (Opleiding = 3) Reistijd_GSC=Reistijd.
EXECUTE.

DESCRIPTIVES VARIABLES=Reistijd_ATC Reistijd_FIL Reistijd_GSC
  /STATISTICS=MEAN STDDEV MIN MAX.

GRAPH
  /HISTOGRAM=Reistijd_ATC.

GRAPH
  /HISTOGRAM=Reistijd_FIL.

GRAPH
  /HISTOGRAM=Reistijd_GSC.

PPLOT
  /VARIABLES=Reistijd_ATC Reistijd_FIL Reistijd_GSC
  /NOLOG
  /NOSTANDARDIZE
  /TYPE=Q-Q
  /FRACTION=BLOM
  /TIES=MEAN
  /DIST=NORMAL.

EXAMINE VARIABLES=Reistijd BY Opleiding
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.

NPAR TESTS
  /K-S(NORMAL)=Reistijd_ATC Reistijd_FIL Reistijd_GSC
  /MISSING ANALYSIS.
