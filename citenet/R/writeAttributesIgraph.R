writeAttributesIgraph <- function( graff, fileName="CNA.csv" )
{

    
    if( fileName=="CNA.csv" )
    {
    
        fileName <- paste( "CNA ", date(), ".csv", sep="" )
    
        fileName <- gsub( ":", "-", fileName )
    
    }
    
    
    tbl <- V(graff)

    atts.list <- list.vertex.attributes( graff )

    for( i in 1:length( atts.list ) )
    {
       temp.vector <- get.vertex.attribute(graff, atts.list[i] )

       tbl <- cbind( tbl, temp.vector )
    }

    tbl <- as.data.frame(tbl)

    names( tbl ) <- c( "ID", atts.list )

    write.csv( tbl, fileName, row.names=F)

}
