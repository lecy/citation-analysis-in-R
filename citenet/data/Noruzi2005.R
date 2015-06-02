load("Noruzi2005.rda")

Noruzi2005$filename <- file.path(getwd(), "Noruzi2005.sqlite")
Noruzi2005$sessiondata$dbFilename <- file.path(getwd(), "Noruzi2005.sqlite")
Noruzi2005$searchdata$filename  <- file.path(getwd(), "Noruzi2005.sqlite")
