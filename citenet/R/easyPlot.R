easyPlot <- function( graff, graph.layout=F, logScale=T, shortenName=T )
{

    if( graph.layout==T )
    {
        graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
    }
    
    V(graff)$totDegree <- igraph::degree(graff, mode="total")
    
    scale.factor <- (V(graff)$totDegree / max(V(graff)$totDegree))


    if( logScale==F )
    {
        scale.factor <- (V(graff)$totDegree / max(V(graff)$totDegree))
    }
    
    if( logScale==T )
    {
        scale.factor <- log( V(graff)$totDegree + 1 )
        
        scale.factor <- (10/20)*(scale.factor/max(scale.factor))
    }

    if( shortenName==T)
    {
        labels <- substr(V(graff)$name, 0, nchar(V(graff)$name)-11)
    } else {
        labels <- V(graff)$name
    }


    plot( graff,
        edge.arrow.mode=0,                  # turns arrows off
        # vertex.color="dark blue",
        vertex.frame.color="gray",
        edge.width=0.5,                     # width of the lines
        edge.color="light gray",
        vertex.label.color="light yellow",
        vertex.label.family="",
        vertex.label.font=2,
        vertex.size = 20*scale.factor,
        vertex.label.cex=1*scale.factor,
        vertex.label=labels
        )


}
