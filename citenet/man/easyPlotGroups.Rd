\name{easyPlotGroups}
\alias{easyPlotGroups}
\title{Indicates Group Membership on Plots for Subset Functions}
\description{
  \code{easyPlotGroups} utilizes the \code{igraph} plotting function
  with pre-set parameter values.
}
\usage{easyPlotGroups( graff, graph.layout=F, inColor=T )}
\arguments{
\item{graff}{An \code{igraph} network object.}
\item{graph.layout}{Should a layout be performed?}
\item{inColor}{Whether to plot in color or using a grayscale.}
}
\details{
  Nodes are sized according to a \dQuote{local} centrality, meaning one
  calculated from the current graph (as opposed to using the \code{CitedBy}
  attribute which is a global in-degree centrality).  Note that the importance
  of nodes on the final level of data collection might be under-emphasized
  with the local centrality measures.  

  The \code{layout.fruchterman.reingold} function in \code{igraph} is used to
  arrange nodes on the graph. This is a memory-intensive operation, so the
  default is to not perform the layout. If you are plotting the same graph
  several times use the \code{layoutGraph} function to avoid performing
  the layout multiple times.  
}
\value{
  \code{NULL}
}
\seealso{
  \code{\link{layout.fruchterman.reingold}}, \code{\link{layoutGraph}},
  \code{\link{findGroups}}
}

\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
g <- findGroups( g )
easyPlotGroups( g, graph.layout=TRUE, inColor=TRUE )
V(g)$color <- V(g)$groups
g.sub <- extractGroups( g, c(2,3,4) )
easyPlot( g.sub, TRUE )
}

