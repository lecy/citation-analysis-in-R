load("Garfield1964.rda")

Garfield1964$filename <- file.path(getwd(), "Garfield1964.sqlite")
Garfield1964$sessiondata$dbFilename <- file.path(getwd(), "Garfield1964.sqlite")
Garfield1964$searchdata$filename  <- file.path(getwd(), "Garfield1964.sqlite")
