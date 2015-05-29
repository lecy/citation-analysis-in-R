removeEdgeInCycle <- function( graff, edge.id )
{

    library( sna )
    
    graff2 <- graff
    
    delete.edges(graff2, edge.id)
    
    detach(package:sna)
    
    return( graff2 )
    

}
