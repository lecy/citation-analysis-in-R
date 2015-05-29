\name{findCycles}
\alias{findCycles}
\title{Diagnostics to Identify Cycles}
\description{
  Plots a graphs with cycles in order to identify problematic links.
}
\usage{findCycles( graff, maxlength.par=3 )}
\arguments{
\item{graff}{\code{sna} network object.}
\item{maxlength.par}{What is the longest cycle that the algorith should search for?}
}
\details{
  Note that the function accepts an \code{sna} object, not a \code{cna}
  database or an \code{igraph} network. Check to see that 
  \code{class(graff) = "network"}.

  Cycles are links that leave from a source node and return back to the same
  node via a directed path.  Cycles cause problems with various network
  algorithms such as main paths, and thus we want to find them and eliminate them.

  Cycles appear in citation networks for several reasons including:
  \enumerate{
    \item{erroneous data}
    \item{papers that cite working papers that are later published}
    \item{books that go into several editions}
  }
  They often manifest as one publication that cites another publication
  that has yet to be written, or time-traveling citations (not a bad trick!).

  The easiest way to deal with cycles is to delete the problematic time-traveling
  links and thus break the cycle.  This is done via the \code{removeEdgeInCycle}
  function, but the edges must first be diagnosed through the \code{findCycles}
  function.  This function plots a graphs of the nodes and edges that make up the
  cycles in the graph, and also prints a list of the edges and edge id's. The id's
  are used in the \code{removeEdgeInCycle} function.

  Note that algorithms that search for cycles are extremely memory intensive. 
  As a result, use the \code{maxlength.par} parameter with caution. For more
  information on this, see the \code{kcycle.census} function documentation in the
  \code{sna} package.
}
\value{
  \code{NULL}
}
\seealso{
  \code{\link{kcycle.census}}, \code{\link{removeEdgeInCycle}}
}
\examples{
data( Price1965 )
g <- cnaToSna( Price1965 )

findCycles( g )
g <- removeEdgeInCycle( g, 823 )
}

