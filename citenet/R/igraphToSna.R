igraphToSna <- function( graff )
{
    # create edgelist
    
    df1 <- get.edges(graff, V(graff))
    
    mat1 <- as.matrix( df1 )
    
    
    
    # create attributes
    
    att.list <- list.vertex.attributes( graff )
    
    
    
    # call the network creation function from "network"
    
    #library(network)
    
    g <- network::network( mat1 )
    
    for( i in 1:length(att.list) )
    {
        
        att.name <- att.list[i]
        att.value <- as.character(get.vertex.attribute( graff , att.list[i]))
        
        g <- network::set.vertex.attribute(g, attrname=att.name, value=att.value,
                v=seq_len(network::network.size(g)))
    }
    
    g <- network::delete.vertices( g, sna::isolates( g ) )
    #detach(package:network)
    
    
    
    return( g )
    
}