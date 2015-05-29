\name{summary.rcnadata}
\alias{summary.rcnadata}
\title{Return the Relevant Values of a RcnaData Object}
\description{
  Produce a summary of the relevant values (database information, creation
  date, and search parameters) of a RcnaData object.
}
\usage{
\method{summary}{rcnadata}(object, \dots)

}
\arguments{
  \item{object}{
    \code{RcnaData} object to be summarized.
  }

  \item{\dots}{
    Additional parameters, passed to the parent \code{summary} function
    if needed.
  }
}
\details{
  This function produces a summary that includes the most relevant values
  for a given \code{RcnaData} object. The function returns a list containing
  the following fields:
  \itemize{
    \item{creation date}
    \item{database filename}
    \item{search parameters}{A list containing the following fields:
      \itemize{
        \item{seed articles}
        \item{stop level}
        \item{sampling per level}
        \item{check minimum cites}
        \item{minimum cites}{(only present if \code{check minimum cites} is
          \code{TRUE})}
        \item{check year range}
        \item{minimum year}{(only present if \code{check year range} is
          \code{TRUE})}
        \item{maximum year}{(only present if \code{check year range} is
          \code{TRUE})}
      }}
    \item{publications on DB}{(only present if the database file can be
      succesfully opened)}
    \item{relationships on DB}{(only present if the database file can be
      succesfully opened)}
  }
}
\value{
  \code{List} containing the relevant values for the \code{RcnaData} object,
  as described in the previous section.
}
\keyword{ misc }
