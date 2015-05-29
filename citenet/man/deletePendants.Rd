\name{deletePendants}
\alias{deletePendants}
\title{Removes Pendants from a Network}
\description{
  Pendants in this context are nodes only connected through one incoming tie.
}
\usage{deletePendants( graff )}
\arguments{
  \item{graff}{An \code{igraph} network object.}
}
\details{
  Pendants are very common in a citation graph and create star formations
  around some nodes.  They can add to a graph's complexity, though.
  Sometimes it is beneficial to remove the pendants in order to examine
  the core of a network.
}
\value{
  Returns a new \code{igraph} network object with pendants removed.
}
\seealso{
\code{\link{deleteIsolates}}, \code{\link{getMainComponent}}
}
\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
easyPlot( g, TRUE )
g.sub <- deletePendants( g )
easyPlot( g.sub, TRUE )
}
