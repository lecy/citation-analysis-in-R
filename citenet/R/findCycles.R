findCycles <- function( graff, maxlength.par=3 )
{

    library( sna )
    
    kcyc <- kcycle.census(graff, maxlen = maxlength.par, mode = "digraph", cycle.comembership = "none")

    cs <- colSums( kcyc$cycle.count )


    
    # Name the edges from the original graph so they can be used as an index
    #
    # g$mel is the list of all edges
    
    set.edge.attribute(graff, attrname="edge.id", value=1:length(graff$mel), e=1:length(graff$mel))
    
    
    
    

    # cand.list represents all vertices that are part of a cycle
    
    cand.list <- NULL

    for( i in 2:length(cs) )
    {

        if( cs[i] > 0 )
        {
            cand.list <- c( cand.list, (i-1) )
        }

    }


    if( is.null( cand.list ) )
    {
    
        print( "The graph has no cycles" )
        
        return()
    
    }
    

    g2 <- get.inducedSubgraph( graff, cand.list )
    
    
    
    
    # Print out the list of edges for deletion purposes.

    
    e.list <- as.matrix(g2, matrix.type="edgelist", attrname="edge.id" )
    
    # alternatively could use as.edgelist.sna( g, attrname = "edge.id" )
    
    # the edgelist does not come with names, so must add them
    

    
    
    
    
    
    df1 <- data.frame( e.list )
    
    names( df1 ) <- c("from", "to", "edge.id" )
    
    
    nmz <- attr( e.list, "vnames" )
    
    df2 <- data.frame( 1:length(nmz), nmz )
    
    names( df2 ) <- c( "id", "name" )
    

    
    m1 <- merge( df1, df2,  by.x="from", by.y="id" )
    
    m2 <- merge( m1, df2, by.x="to", by.y="id" )
    
    df3 <- as.data.frame( m2[,3:5] )
    
    names( df3 ) <- c("Edge.ID", "From", "To" )
    
    print( df3 )
    
    if( network::network.size( g2 ) > 1 )
    {
        gplot( g2, displaylabels = T, diag = T  )
    }
        
    # detach( package:network)
        
    # return()

}
