\name{getMainComponent}
\alias{getMainComponent}
\title{Retain the Main (Largest) Component from a Set of Graphs}
\description{
  If the graph has been split into several components, this function
  allows you to extract the largest component.
}
\usage{getMainComponent( graff )}
\arguments{
\item{graff}{An \code{igraph} network object.}
}
\details{
  The network can be fractured by the \code{filterByDegree} function
  or the \code{extractGroups} function. The 
  \code{getMainComponent} function allows you to retain only the largest component.
}
\value{
  Returns a new \code{igraph} network object that is fully connected.
}
\seealso{
  \code{\link{deletePendants}}, \code{\link{deleteIsolates}},
  \code{\link{filterByDegree}}, \code{\link{extractGroups}}
}
\examples{
data( Price1965 )
g <- cnaToIgraph( Price1965 )
g.sub <- filterByDegree( g, 500 )
easyPlot( g.sub, TRUE )

g.sub <- getMainComponent( g.sub )
easyPlot( g.sub, TRUE )
}
