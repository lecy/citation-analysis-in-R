\name{deleteIsolates}
\alias{deleteIsolates}
\title{Removes Isolates from a Network}
\description{
  Isolates are nodes that are not connected to the rest of the network.
}
\usage{deleteIsolates( graff )}

\arguments{
\item{graff}{An \code{igraph} network object.}
}
\details{
  Isolates will not occur naturally in citation networks, but they are
  created by the \code{filterByDegree} function and possibly other operations.
}
\value{
  Returns a new igraph network object with isolated removed.
}

\seealso{
\code{\link{deletePendants}}, \code{\link{getMainComponent}}
}
\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
g.sub <- filterByDegree( g, 40 )
g.sub <- layoutGraph( g.sub )
plot( g.sub, vertex.label.family="" )

g.sub <- deleteIsolates( g.sub )
g.sub <- layoutGraph( g.sub )
plot( g.sub, vertex.label.family="" )
}
