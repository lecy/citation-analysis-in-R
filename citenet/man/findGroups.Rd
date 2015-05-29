\name{findGroups}
\alias{findGroups}
\title{Identify Sub-domains Within the Network}
\description{
  The \code{findGroups} function applies a community detection algorithm
  to identify sub-domains and adds a group attribute.
}
\usage{findGroups( graff, r.walks=100 )}

\arguments{
\item{graff}{An \code{igraph} network object}
\item{r.walks}{A parameter for the \code{walktrap.community} function
   in \code{igraph}}
}
\details{
  The function \code{findGroups} performs a community detection algorithm
  using the \code{walktrap.community} function in \code{igraph}.The number of
  communities is determined by the set that maximizes the modularity score
  (see \code{modularity} in the \code{igraph} package). This community structure
  is visualized using the \code{easyPlotGroups} function, which labels the nodes
  with the group IDs. The \code{extractGroups} function can they be used to drill
  down into the network and further examine a particular sub-domain of the network. 

  The \code{r.walks} parameter determines the number of steps in each random walk
  that is used to discover community structure (see the \code{igraph} documentation).
  In general, lower values results in more groups, higher values results in fewer
  groups.
}
\value{
  An \code{igraph} network with a \dQuote{groups} attribute created.
}
\seealso{
  \code{\link{easyPlotGroups}}, \code{\link{extractGroups}}
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
