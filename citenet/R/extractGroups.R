extractGroups <- function( graff, members )
{

    newGraff <- subgraph( graff, V(graff)[ groups %in% members ] )
    
    return( newGraff )

}
