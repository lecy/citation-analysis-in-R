easyPlotGroups <- function( graff, graph.layout=F, inColor=T )
{


    if( graph.layout==T )
    {
        graff <- set.graph.attribute(graff, "layout", layout.fruchterman.reingold(graff) )
    }
    
    
    V(graff)$totDegree <- igraph::degree(graff, mode="total")
    
    graff <- findGroups(graff)
    
    num.groups <- max( V(graff)$groups )
    
    
    if( inColor==T )
    {
        palette(rainbow(num.groups))     # one color for each group
    }

    
    if( inColor==F )
    {
        palette( gray( 1:num.groups / (num.groups+2) ) )
    }
    
    scale.factor <- (V(graff)$totDegree / max(V(graff)$totDegree))
    
    #  scale.factor <- log( V(graff)$totDegree )
    
    plot( graff,
          edge.arrow.mode=2,                    # 0 turns arrows off
          edge.arrow.size=0.25,
          vertex.color=V(graff)$groups,         # color of the node
          edge.width=0.5,                       # width of the lines
          edge.color="light gray",
          vertex.label=V(graff)$groups,         # label with group name
          vertex.label.color="white",           # color of the labels
          vertex.label.family="",               # font family, leave blank if you want to export
          vertex.label.font=2,                  # 1 is plain, 2 is bold
          vertex.size = 20*scale.factor,        # size of the largest node
          vertex.label.cex=1*scale.factor,      # size of the text
          vertex.frame.color=V(graff)$groups,   # color of the rim on the nodes
        )

    palette("default")   # reset palette colors

}
