\name{topAuthors }
\alias{topAuthors }
\title{Authors that Are Highly Cited}
\description{
  Creates charts of the most highly cited authors in the sample, both
  by total cite count and by average cites per publication.
}

\usage{topAuthors( rcnadata, setNum=10 )}

\arguments{
\item{rcnadata}{\code{cna} citation database object.}
\item{setNum}{The number of authors to include on the chart.}
}
\details{
  This function accepts a \code{cna} database as an argument and creates
  several charts of the most prominent authors in the sample.
}

\value{
  \code{NULL}
}

\seealso{
\code{\link{histYears}}, \code{\link{histCitedBy}},
\code{\link{topCited}}, \code{\link{topJournals}}
}

\examples{
data( Price1965 )
topAuthors( Price1965 )
}
