## Effectmaat niet gerapporteerd, ik zie geen overeenstemming van effectmaten bij de MW U 

# effectmaat r, correlatie, zie Field blz. 57
RNGkind(sample.kind = "Rounding")
set.seed(0)

Goede_student_ec <- c(0, 3, 6, 6, 6, 6, 6, 6, 6)
Matige_student_ec <- c(0, 0, 0, 3, 6, 6, 6, 6, 6)
Slechte_student_ec <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6)

Resultaten_nl_studenten <- rbind (
  t(replicate(450, sample(Goede_student_ec, 11, replace = TRUE))), 
  t(replicate(200, sample(Matige_student_ec, 11, replace = TRUE))),
  t(replicate(300, sample(Slechte_student_ec, 11, replace = TRUE))))
Punten_jaar2_NL <- margin.table(Resultaten_nl_studenten, 1)

Resultaten_internationale_studenten <- rbind (
  t(replicate(150, sample(Goede_student_ec, 11, replace = TRUE))), 
  t(replicate(100, sample(Matige_student_ec, 11, replace = TRUE))),
  t(replicate(300, sample(Slechte_student_ec, 11, replace = TRUE))))
Punten_jaar2_inter <- margin.table(Resultaten_internationale_studenten, 1)
Studentnr <- sample(3000000:4000000, length(c(Punten_jaar2_NL, Punten_jaar2_inter)))

Studiepunten_studiejaar2 <- data.frame(Studentnr, c(Punten_jaar2_NL, Punten_jaar2_inter), 
                           c(rep("Nederlands", length(Punten_jaar2_NL)), rep("buitenlands", length(Punten_jaar2_inter))))
colnames(Studiepunten_studiejaar2)<-c("Studentnummer", "Studiepunten", "Vooropleiding")
Studiepunten_studiejaar2 <- Studiepunten_studiejaar2[order(Studentnr),]
