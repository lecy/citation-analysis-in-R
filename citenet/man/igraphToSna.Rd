\name{igraphToSna}
\alias{igraphToSna}
\title{Translate an Igraph Object to an Sna Network Object}
\description{
  The \code{igraphToSna} function takes an \code{igraph} network and translates it to 
  an \code{sna} network object for the purpose of network analysis.}
\usage{igraphToSna( graff )}
\arguments{
\item{graff}{A network of class igraph.}
}
\details{
  The user may want to do some pre-processing in \code{igraph} and then
  use the new graph in the \code{sna} or \code{latentNet} packages.  This
  is a bridging function that allows the user to translate an
  \code{igraph} object into an \code{sna} network object while maintaining
  attributes.
}
\value{
  Returns an \code{sna} network object.
}
\seealso{
\code{\link{cnaToIgraph}}, \code{\link{igraphToSna}},
\code{\link{writeVNA}}, \code{\link{writePajek}},
\code{\link{writeAttributesIgraph}}
}

\examples{
data( Price1965 )
g <- cnaToIgraph( Price1965 )
g2 <- igraphToSna( g )
}
