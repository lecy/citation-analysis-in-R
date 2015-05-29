\name{histYears}
\alias{histYears}
\title{Histogram of Publication Years}
\description{
  Create a barplot of the publication years in the data.
}
\usage{histYears( rcnadata )}
\arguments{
  \item{rcnadata}{\code{cna} citation database object.}
}
\details{
  This function accepts a \code{cna} database as an argument and
  creates a barplot of the years of publication.
}
\value{
  \code{NULL}
}
\seealso{
  \code{\link{histCitedBy}}, \code{\link{topCited}},
  \code{\link{topAuthors}}, \code{\link{topJournals}}
}
\examples{
data( Price1965 )
histYears( Price1965 )
}
