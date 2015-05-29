cnaToIgraph <- function( rcnadata )
{

    el <- getEdgelist( rcnadata )
    
    el <- as.data.frame( el[,1:2] )
    
    att <- getAttributes( rcnadata )
    
    new.graff <- graph.data.frame( el, vertices=att )
    
    simplify(new.graff, remove.loops = TRUE)
    
    return( new.graff )

}
