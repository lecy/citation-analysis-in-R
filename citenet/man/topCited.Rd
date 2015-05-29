\name{topCited}
\alias{topCited}
\title{Reports the Most Highly Cited Articles}
\description{
  Creates a dotchart of the most highly cited articles in the sample
}
\usage{topCited( rcnadata, setNum=10 )}
\arguments{
\item{rcnadata}{\code{cna} citation database object}
\item{setNum}{The number of articles to include on the chart.}
}
\details{
  This function accepts a \code{cna} database as an argument and
  creates a chart of the most highly cited articles.
}

\value{
\code{NULL}
}

\seealso{
  \code{\link{histYears}}, \code{\link{histCitedBy}}, \code{\link{topAuthors}}, \code{\link{topJournals}}
}

\examples{
data( Price1965 )
topCited( Price1965 )
}

