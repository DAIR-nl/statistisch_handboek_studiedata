# De opleidingsdirecteur van de bachelor natuurkunde krijgt vanuit de 
# studentenraad te horen dat de eerstejaarsstudenten de eerste periode als erg 
# druk ervaren. Om te onderzoeken hoe deze druk vermindert kan worden, wil hij 
# uitvinden hoeveel tijd deze studenten per week besteden aan hun vakken. Hij 
# verzamelt gegevens van het aantal uur per week dat eerstejaars studenten 
# besteden aan de vakken in periode 1: lineaire algebra, relativiteitstheorie 
# en kosmologie. Op deze manier kan hij onderzoeken of er verschillen tussen de 
# tijdsbesteding aan de verschillende vakken zijn om te bepalen welke vakken 
# aangepast moeten worden.

# Dataset heeft drie kolommen: Studentnummer, Vak en Aantal uren per week. We
# nemen 80 eerstejaars studenten

# set seed
set.seed(12345)

# Simuleer studentnummers
Studentnummers_opties <- c(4000000:4500000)
Studentnummer_uniek <- sample(Studentnummers_opties, 80)
Studentnummer <- rep(Studentnummer_uniek, times = 3)
Studentnummer <- as.factor(Studentnummer)
# Maak vakken
Vak <- rep(c("Lineaire Algebra", "Relativiteitstheorie", "Kosmologie"), 
           each = 80)

# Simuleer aantal uur studeren per vak
Uren_Lineaire_Algebra <- round(rnorm(80, 10, 2))
hist(Uren_Lineaire_Algebra)

Uren_Relativiteitstheorie <- round(rnorm(80, 20, 4))
hist(Uren_Relativiteitstheorie)

Uren_Kosmologie <- round(rnorm(80, 11, 3))
hist(Uren_Kosmologie)

Studieuren <- c(Uren_Lineaire_Algebra, Uren_Relativiteitstheorie, 
                Uren_Kosmologie)

# Maak dataset
Studieuren_natuurkunde <- cbind.data.frame(Studentnummer, Vak, Studieuren)

# Sorteer data

Studieuren_natuurkunde <- Studieuren_natuurkunde[order(Studieuren_natuurkunde$Studentnummer),]


# test repeated measures ANOVA

rma <- ezANOVA(Studieuren_natuurkunde, dv = Studieuren, wid = Studentnummer,
               within = Vak, detailed = TRUE, return_aov = TRUE)

print(rma)


pairwise.t.test(Studieuren_natuurkunde$Studieuren, Studieuren_natuurkunde$Vak,
                p.adjust.method = "bonferroni")
