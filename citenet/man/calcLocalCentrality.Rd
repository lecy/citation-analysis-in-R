\name{calcLocalCentrality}
\alias{calcLocalCentrality}
\title{Add an Attribute with Centrality Calculated from the Current Network}
\description{
  Calculate the total degree centrality of nodes in the graph and append
  this as a new attribute.
}
\usage{calcLocalCentrality( graff )}
\arguments{
\item{graff}{An \code{igraph} object.}
}
\details{
  Each publication has an attribute called \dQuote{CitedBy} which contains
  information on how many times each article is cited. This can be treated
  as the \dQuote{global} in-degree centrality measure (global referring to
  the entire citation network in Google Scholar). It may be useful to calculate
  centrality measures for the sample graph only, though.
  This function creates a new attribute called \dQuote{locCentrality} and
  calculates the total degree centrality of each node in the sample.
  Note that this will under-state the important of nodes at the edge of the
  network (at the last level of data collected) because even if they are
  highly-cited it will not be reflected by the local measures.
}
\value{
  New igraph object.
}

\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
g <- layoutGraph( g )
g <- calcLocalCentrality( g )
plot( g, vertex.label.family="", edge.arrow.mode=0, vertex.size=20*(V(g)$CitedBy/max(V(g)$CitedBy))  )
plot( g, vertex.label.family="", edge.arrow.mode=0, vertex.size=20*(V(g)$locCentrality/max(V(g)$locCentrality))  )
}

