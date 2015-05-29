deletePendants <- function( graff )
{

    newGraff <- subgraph(graff, V(graff)[ (igraph::degree(graff, mode="in") > 1) | (igraph::degree(graff, mode="out") > 0 ) ] )

    return( newGraff )


}
