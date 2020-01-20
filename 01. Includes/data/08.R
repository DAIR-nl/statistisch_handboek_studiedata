## Effectmaat niet gerapporteerd, ik zie geen overeenstemming van effectmaten bij de MW U 

RNGkind(sample.kind = "Rounding")
set.seed(0)

Goede_student_ec <- c(0, 3, 6, 6, 6, 6, 6, 6, 6)
Matige_student_ec <- c(0, 0, 0, 3, 6, 6, 6, 6, 6)
Slechte_student_ec <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6)

Resultaten_nl_studenten <- rbind (
  t(replicate(401, sample(Goede_student_ec, 11, replace = TRUE))), 
  t(replicate(203, sample(Matige_student_ec, 11, replace = TRUE))),
  t(replicate(309, sample(Slechte_student_ec, 11, replace = TRUE))))
Punten_jaar2_NL <- margin.table(Resultaten_nl_studenten, 1)

Resultaten_internationale_studenten <- rbind (
  t(replicate(250, sample(Goede_student_ec, 11, replace = TRUE))), 
  t(replicate(100, sample(Matige_student_ec, 11, replace = TRUE))),
  t(replicate(200, sample(Slechte_student_ec, 11, replace = TRUE))))
Punten_jaar2_inter <- margin.table(Resultaten_internationale_studenten, 1)
Studentnr <- sample(3000000:4000000, length(c(Punten_jaar2_NL, Punten_jaar2_inter)))

Punten_jaar2 <- data.frame(Studentnr, c(Punten_jaar2_NL, Punten_jaar2_inter), 
                           c(rep("ja", length(Punten_jaar2_NL)), rep("nee", length(Punten_jaar2_inter))))
colnames(Punten_jaar2)<-c("Studentnr", "EC_Jaar2", "Nederlands")
Punten_jaar2 <- Punten_jaar2[order(Studentnr),]