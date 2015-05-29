easyPlotBnW <- function( graff, graph.layout=F, logScale=F, shortenName=T )
{


    if( graph.layout==T )
    {
        graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
    }
    
    
    V(graff)$totDegree <- igraph::degree(graff, mode="total")
    
    graff <- findGroups(graff)
    
    num.groups <- max( V(graff)$groups )
    
    # palette(rainbow(num.groups))  # one color for each group
    
    palette( gray( 1:(num.groups+5) / (num.groups+5) ) )
    
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
          edge.arrow.mode=0,                    # turns arrows off
          vertex.color=V(graff)$groups,         # color of the node
          vertex.frame.color=V(graff)$groups,
          edge.width=0.5,                       # width of the lines
          vertex.label.color="white",           # ( (num.groups) - V(graff)$color  )
          vertex.label.family="",
          vertex.label.font=2,
          vertex.size = 20*scale.factor,
          vertex.label.cex=1*scale.factor,
          vertex.label=labels
          )

    palette("default")

}
