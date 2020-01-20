Geen_leenstelsel <- c(375, 496)
Wel_leenstelsel <- c(369, 394)
Uitval_functiebeperking <- t(data.frame(Geen_leenstelsel, Wel_leenstelsel))
colnames(Uitval_functiebeperking) <- c("Wel uitval", "Geen uitval")

Geen_leenstelsel_n43 <- c(8, 14)
Wel_leenstelsel_n43 <- c(5, 16)
Uitval_functiebeperking_n43 <- t(data.frame(Geen_leenstelsel_n43, Wel_leenstelsel_n43))
colnames(Uitval_functiebeperking_n43) <- c("Wel uitval", "Geen uitval")