calcLocalCentrality <- function( graff )
{
    V(graff)$locCentrality <- igraph::degree(graff, mode="total")

    return( graff )
}
