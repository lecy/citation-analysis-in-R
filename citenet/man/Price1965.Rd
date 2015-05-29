\name{Price1965}
\docType{data}
\alias{Price1965}
\title{Dataset for Price1965}
\description{
  RcnaData object as returned by the the data gathering tool for the seed
  publication \dQuote{Networks of scientific papers}
  by Price, D.J. (1965), with 3 levels of sampling at a
  rate of 2 percent.
  It contains a total of 759 articles and 1219 relations among these articles.

  The full file name of the Sqlite database that contains the information of
  this dataset can be found at:

  \code{system.file("data/Price1965.sqlite", package="citenet")}
}
\usage{data(Price1965)}
\format{A \code{RcnaData} object pointing to a SQLite database.}
\references{
  Price, D.J. (1965)
  \emph{Networks of scientific papers}
}
\keyword{datasets}
