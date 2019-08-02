set.seed(93)
level1_cijfers <- c(4, 4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5, 10)
level2_cijfers <- c(4.5, 5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0, 9.5)
level3_cijfers <- c(5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5, 9.0)
level4_cijfers <- c(5.5, 6.0, 6.5, 7.0, 7.5, 8.0, 8.5)
level5_cijfers <- c(6.0, 6.5, 7.0, 7.5, 8.0)
level6_cijfers <- c(6.5, 7.0, 7.5)
level7_cijfers <- c(7.0, 7.0)

Wiskundecijfers_level1 <- sample(level1_cijfers, 40, replace = TRUE)
Wiskunde_cijfers_level2 <- sample(level2_cijfers, 80, replace=TRUE)
Wiskunde_cijfers_level3 <- sample(level3_cijfers, 160, replace=TRUE)
Wiskunde_cijfers_level4 <- sample(level4_cijfers, 160, replace=TRUE)
Wiskunde_cijfers_level5 <- sample(level5_cijfers, 160, replace=TRUE)
Wiskunde_cijfers_level6 <- sample(level6_cijfers, 160, replace=TRUE)
Wiskunde_cijfers_level7 <- sample(level7_cijfers, 300, replace=TRUE)
Wiskunde_cijfers_level2_tot_level7 = c(Wiskunde_cijfers_level2,
                                       Wiskunde_cijfers_level3,
                                       Wiskunde_cijfers_level4,
                                       Wiskunde_cijfers_level5,
                                       Wiskunde_cijfers_level6,
                                       Wiskunde_cijfers_level7)
Wiskunde_cijfers <- c(7.0)
Wiskunde_cijfers <- append(Wiskundecijfers_level1, Wiskunde_cijfers_level2_tot_level7)