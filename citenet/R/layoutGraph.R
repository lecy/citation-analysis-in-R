layoutGraph <- function( graff, force=F )
{
   
    if( vcount( graff ) > 5000 )
    {
        print("Warning: the network is large")
        print("To continue, use arg force=T" )
        
        if( force==T )
        {
        
            graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
        
        }
    }


    
    if( vcount( graff ) < 5001 )
    {
        graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
    }

    
    return( graff )

    
}
