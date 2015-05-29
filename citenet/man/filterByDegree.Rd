\name{filterByDegree}
\alias{filterByDegree}
\title{Delete Nodes that Are Cited Less than N Times}
\description{
  Reduce the complexity of the graph by removing nodes that
  are not cited more than \code{N} times.  
}
\usage{filterByDegree( graff, citeNum )}
\arguments{
\item{graff}{An \code{igraph} network object.}
\item{citeNum}{The cutoff value for retaining the publication in the subgraph.}
}
\details{
  The \code{citeNum} is compared against the \code{CitedBy} attribute value to
  see if the publication is retained in the filtered subgraph.If \code{citeNum}
  is ten, for example, then only pulbications with more than ten citations
  will be retained in the network. The \code{histCitedBy} function reports summary
  statistics on citation counts for articles in the sample. This can be used as a
  guide for cutoff values (the median is a natural choice).
}

\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
histCitedBy( Noruzi2005 )
g.sub <- filterByDegree( g, 14 )
easyPlot( g.sub, TRUE )

g.sub <- layoutGraph( g.sub )
plot( g.sub, vertex.label.family="" )
}
