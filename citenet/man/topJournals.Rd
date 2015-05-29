\name{topJournals}
\alias{topJournals}
\title{Most Frequently Appearing Journals in the Network}
\description{
  Creates charts of the most frequently appearing journals in the network.
}
\usage{ topJournals( rcna, setNum=10 )}
\arguments{
\item{rcna}{\code{cna} citation database object.}
\item{setNum}{The number of cases to include on the chart.}
}
\details{
  This function accepts a \code{cna} database as an argument and creates
  a dotchart of the most prominent journals in the sample.
}
\value{
  \code{NULL}
}

\seealso{
\code{\link{histYears}}, \code{\link{histCitedBy}},
\code{\link{topCited}}, \code{\link{topAuthors}}
}

\examples{
data( Noruzi2005 )
topJournals( Noruzi2005 )
}
