## De opleidingsdirecteur van de Bachelor Anthropologie vraagt zich af wat de invloed is van de instroom van internationale studenten. Krijgen studenten uit bepaalde landen vaker een positief BSA dan studenten uit andere landen?

RNGkind(sample.kind = "Rounding")
set.seed(1) #noodzakelijk omdat we simulate.p.values gebruiken bij de fisher.test
Landen_instroom <- c("NL", "GE", "IT", "UK", "BE", "ES", "US")  ##ISO-codes
Pos_bsa <- c(1171, 213,  60, 119,  45,  81, 270)
Verhouding <- c(0.1, 0.14, 0.36, 0.04, 0.12, 0.22, 0.19)
Neg_bsa <- round(Pos_bsa * Verhouding)
Bsa_kt <- data.frame(Pos_bsa, Neg_bsa)
Bsa_kt <- t(Bsa_kt)
colnames(Bsa_kt) <- Landen_instroom

Pos_bsa_n10 <- c(49, 37, 62, 67, 73, 70, 69)
Neg_bsa_n10 <- c(10, 7, 13, 14, 15, 19, 18)
Bsa_kt_n10 <- data.frame(Pos_bsa_n10, Neg_bsa_n10)
Bsa_kt_n10 <- t(Bsa_kt_n10)
colnames (Bsa_kt_n10) <- Landen_instroom