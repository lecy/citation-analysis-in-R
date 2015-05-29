cnaToSna <- function( rcnadata )
{

    el <- getEdgelist( rcnadata )[,1:2]
    
    att <- getAttributes( rcnadata )
    
    
    #library(network)
    
    library( sna )
    
    g <- network::network( el, vertex.attr=att )
    
    g <- network::delete.vertices( g, isolates( g ) )
    
    #detach(package:network)
    
    diag.remove( g )
    
    detach( package:sna )
    
return( g )

}

