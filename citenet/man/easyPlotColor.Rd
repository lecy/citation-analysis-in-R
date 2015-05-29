\name{easyPlotColor}
\alias{easyPlotColor}
\title{Quick Way to Plot a Citation Network with a Group Attribute Using Color}
\description{
  \code{easyPlotColor} utilizes the \code{igraph} plotting function with
  pre-set parameter values.
}
\usage{easyPlotColor( graff, graph.layout=F, logScale=F, shortenName=T )}
\arguments{
\item{graff}{An \code{igraph} network object.}
\item{graph.layout}{Should a layout be performed?}
\item{logScale}{Scales the node size by a log of total degree versus total degree.}
\item{shortenName}{Strips the sequential id from the names of the vertices.}
}
\details{
  Nodes are sized according to a \dQuote{local} centrality, meaning one calculated
  from the current graph (as opposed to using the \code{CitedBy}attribute which
  is a global in-degree centrality). Note that the importance of nodes on the final
  level of data collection might be under-emphasized with the local centrality measures.

  The \code{layout.fruchterman.reingold} function in \code{igraph} is used to arrange
  nodes on the graph.  This is a memory-intensive operation, so the default is to not
  perform the layout.  If you are plotting the same graph several times use the
  \code{layoutGraph} function to avoid performing the layout multiple times.  

  Node degree distributions are generally highly skewed. As a result, the user may
  prefer to scale the size of nodes by the log of the node degree centrality versus
  the total degree centrality.The option \code{logScale} allows for this.

  The node shades are set using the palette and rainbow functions.The more groups
  you have the closer the colors will be.

  If you would like to change the default plot parameters use the
  \code{fix( easyPlotColor )} command to access the function.
}
\value{
\code{NULL}
}
\seealso{
\code{\link{layout.fruchterman.reingold}}, \code{\link{layoutGraph}},
\code{\link{findGroups}}, \code{\link{easyPlot}},
\code{\link{easyPlotBnW}}, \code{\link{easyPlotGroups}}
}

\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
g <- findGroups( g )
easyPlotColor( g, graph.layout=TRUE, logScale=TRUE )

unique( V(g)$groups )
V(g)[ V(g)$groups > 5 ]$groups <- 1
unique( V(g)$groups )
easyPlotColor( g, graph.layout=TRUE, logScale=TRUE )
}
