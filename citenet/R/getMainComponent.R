getMainComponent <- function( graff )
{

    newGraff <- subgraph( graff, subcomponent(graff, 1, "all") )

    return( newGraff )

}
