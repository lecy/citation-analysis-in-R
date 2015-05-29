filterByDegree <- function( graff, citeNum )
{
    
    newGraff <- subgraph(graff, V(graff)[ V(graff)$CitedBy > citeNum ] )
    
    return( newGraff )
    
    
}
