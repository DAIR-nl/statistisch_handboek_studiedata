SET DECIMAL=DOT.

DATA LIST FILE= "G:/DSZ/OKZ/Alg_onderwijsbeleid/17 Student Analytics/16 Statistisch handboek/14 SPSS/Gemiddeld_cijfer_WNS.txt"  free (",")
ENCODING="Locale"
/  
  .

VARIABLE LABELS
 "" 
 .
VARIABLE LEVEL NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 
 NA, NA, NA, NA, NA 
 (scale).

EXECUTE.
