histCitedBy <- function( rcnadata )
{

    dat <- getAttributes( rcnadata )
    
    print( summary( dat$CitedBy ) )
       
    hist( dat$CitedBy, col="blue", breaks=100, xlab="Number of Citations", main="Histogram of Citations")


}
