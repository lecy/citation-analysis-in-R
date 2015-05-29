\name{extractGroups}
\alias{extractGroups}
\title{Create a Subset of a Network Based upon Group Membership}
\description{
  \code{extractGroups} creates a new network that consists of specific domains.
}
\usage{extractGroups( graff, members )}
\arguments{
\item{graff}{An \code{igraph} network object.}
\item{members}{Which groups to retain based upon group id.}
}
\details{
  The function \code{findGroups} performs a community detection algorithm
  using the \code{walktrap.community} function in \code{igraph}
  The number of communities is determined by the set that maximizes the
  modularity score (see \code{modularity} in the \code{igraph} package).
  This community structure is visualized using the \code{easyPlotGroups}
  function, which labels the nodes with the group IDs.The \code{extractGroups}
  function can they be used to drill down into the network and further
  examine a particular sub-domain of the network. 
}
\value{
  A new \code{igraph} object.
}
\seealso{
\code{\link{findGroups}}, \code{\link{easyPlotGroups}}
}

\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
g <- findGroups( g )
easyPlotGroups( g, graph.layout=TRUE, inColor=TRUE )

g.sub <- extractGroups( g, c(2,3,4) )
V(g.sub)$color <- V(g.sub)$groups
easyPlot( g.sub, TRUE )

# To view groups
g.sub <- extractGroups( g, c(2,3,4) )
writeAttributesIgraph( g.sub )
}

