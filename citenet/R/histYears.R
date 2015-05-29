histYears <- function( rcnadata )
{

    dat <- getAttributes( rcnadata )
    
    years <- dat$Year
    
    barplot( table( years ), col="red", main="Publications Per Year" )
    
    
}
