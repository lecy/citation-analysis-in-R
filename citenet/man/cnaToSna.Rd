\name{cnaToSna}
\alias{cnaToSna}
\title{Translate a Cna Database to an Sna Network Object}
\description{
  The \code{cnaToIgraph} function takes a citation database and translates it
  to an \code{sna} network object for the purpose of network analysis.
}
\usage{cnaToSna( rcnadata )}
\arguments{
  \item{rcnadata}{A cna database object.}
}

\details{
  The \code{cnaToIgraph} function creates an sna network object from a cna database.
  The \code{sna} package performs various social network analysis functions, and the
  network object type is used in other packages such as \code{latentNet}.
}

\value{
  Returns an sna network object.
}

\seealso{
  \code{\link{cnaToIgraph}}, \code{\link{igraphToSna}},
  \code{\link{writeVNA}}, \code{\link{writePajek}}
}
\examples{
data( Price1965 )
g <- cnaToSna( Price1965 )
library(sna)
gplot( g )
findCycles( g )
}
