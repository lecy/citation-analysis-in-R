\name{histCitedBy}
\alias{histCitedBy}
\title{Histogram of Citation Patterns}
\description{
  Create a histogram of citation counts for articles in the sample.
}
\usage{histCitedBy( rcnadata )}
\arguments{
\item{rcnadata}{\code{cna} citation database object.}
}
\details{
  This function accepts a \code{cna} database as an argument and creates
  a histogram of the citation counts of articles in the sample.  Summary data
  is also created reporting the \code{min}, \code{median}, \code{mean}, 
  \code{max}, and \code{interquartile range} for citation counts.
}
\value{
  \code{NULL}
}
\seealso{
\code{\link{histYears}}, \code{\link{topCited}},
\code{\link{topAuthors}}, \code{\link{topJournals}}
}
\examples{
data( Price1965 )
histCitedBy( Price1965 )
}
