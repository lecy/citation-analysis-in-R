deleteIsolates <- function( graff )
{

    newGraff <- subgraph(graff, V(graff)[ igraph::degree(graff, mode="total") > 0 ] )

    return( newGraff )

}
