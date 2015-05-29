writeAttributesCna <- function( rcnadata, fileName="CNA.csv" )
{

    if( fileName=="CNA.csv" )
    {
    
        fileName <- paste( "CNA ", date(), ".csv", sep="" )
    
        fileName <- gsub( ":", "-", fileName )
    
    }
    
    tbl <- getAttributes( rcnadata )

    write.csv( tbl, fileName, row.names=F)

}
