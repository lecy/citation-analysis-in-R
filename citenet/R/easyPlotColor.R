# accepts igraph object
# returns null

easyPlotColor <- function( graff, graph.layout=F, logScale=F, shortenName=T )
{


    if( graph.layout==T )
    {
        graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
    }
    
    
    V(graff)$totDegree <- igraph::degree(graff, mode="total")
    
    graff <- findGroups(graff)
    
    num.groups <- max( V(graff)$groups )
    
    palette(rainbow(num.groups))     # one color for each group


    
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
          edge.arrow.mode=2,                    # 0 turns arrows off
          edge.arrow.size=0.25,
          vertex.color=V(graff)$groups,         # color of the node
          edge.width=0.5,                       # width of the lines
          edge.color="light gray",
          vertex.label.color="white",           # color of the labels
          vertex.label.family="",               # font family, leave blank if you want to export
          vertex.label.font=2,                  # 1 is plain, 2 is bold
          vertex.size = 20*scale.factor,        # size of the largest node
          vertex.label.cex=1*scale.factor,      # size of the text
          vertex.frame.color=V(graff)$groups,   # color of the rim on the nodes
          vertex.label=labels
        )

    palette("default")   # reset palette colors

}
