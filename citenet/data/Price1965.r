load("Price1965.rda")

Price1965$filename <- file.path(getwd(), "Price1965.sqlite")
Price1965$sessiondata$dbFilename <- file.path(getwd(), "Price1965.sqlite")
Price1965$searchdata$filename  <- file.path(getwd(), "Price1965.sqlite")

