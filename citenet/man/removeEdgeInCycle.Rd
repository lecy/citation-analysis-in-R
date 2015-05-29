\name{removeEdgeInCycle}
\alias{removeEdgeInCycle}
\title{Remove Problematic Edges}
\description{
  Removes edges in a graph that cause cycles.
}
\usage{removeEdgeInCycle( graff, edge.id )}

\arguments{
\item{graff}{\code{sna} network object.}
\item{edge.id}{The id of edges that will be removed.}
}
\details{
  Note that the function accepts an \code{sna} object, \bold{NOT} a \code{cna}
  database or an \code{igraph} network. Check to see that \code{class(graff) = "network"}.

  Cycles are links that leave from a source node and return back to the same
  node via a directed path.  Cycles cause problems with various network algorithms
  such as main paths, and thus we want to find them and eliminate them.

  Cycles appear in citation networks for several reasons including:
  \enumerate{
    \item{erroneous data}
    \item{papers that cite working papers that are later published}
    \item{books that go into several editions}
  }
  They often manifest as one publication that cites another publication that has
  yet to be written, or time-traveling citations (not a bad trick!).  

  The easiest way to deal with cycles is to delete the problematic time-traveling links
  and thus break the cycle.  This is done via the \code{removeEdgeInCycle} function,
  but the edges must first be diagnosed through the \code{findCycles} function.  This
  function plots a graphs of the nodes and edges that make up the cycles in the graph,
  and also prints a list of the edges and edge id's.  The id's are used in
  the \code{removeEdgeInCycle} function.
}
\value{
  \code{NULL}
}
\seealso{
\code{\link{findCycles}}
}
\examples{
data( Price1965 )
g <- cnaToSna( Price1965 )

findCycles( g )
g <- removeEdgeInCycle( g, 823 )
}
