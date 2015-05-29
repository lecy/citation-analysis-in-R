\name{layoutGraph}
\alias{layoutGraph}
\title{Visually Appealing Layout for Plotting Graphs}
\description{
  The \code{layoutGraph} function applies the 
  \code{layout.fruchterman.reingold} procedure from \code{igraph}.
}
\usage{layoutGraph( graff, force=F )}
\arguments{
\item{graff}{An \code{igraph} network object.}
\item{force}{Procede with layout for large graphs?}
}

\details{
  The \code{layout.fruchterman.reingold} function in \code{igraph} is used
  to arrange nodes on the graph.  This is a memory-intensive operation, so
  the default is to not perform the layout.  If you are plotting the same graph
  several times use the \code{layoutGraph} function to avoid performing the
  layout multiple times.

  If the graph is large, above 5000 nodes, then a warning is given and the
  layout algorithm is not performed.  This happens because the layout procedure
  can be very memory intensive and can take a long time or cause the program
  to crash.  If you would like to proceed then use \code{force=T} in the arugment.
}
\value{
  New \code{igraph} object with a network attribute for the layout.
}

\seealso{
  \code{\link{layout.fruchterman.reingold}}, \code{\link{easyPlot}}
}
\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
plot( g, vertex.label.family="" )
g <- layoutGraph( g )
plot( g, vertex.label.family="" )
}
