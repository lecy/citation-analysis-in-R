\name{getEdgelist}
\alias{getEdgelist}
\title{Return the Edge List from a RcnaData Object}
\description{
  Return the edge list, as described on the VNA format, as
  \code{data.frame}s based on the information of a \code{RcnaData} object.
}
\usage{
getEdgelist(rcnadata)
}
\arguments{
  \item{rcnadata}{
    \code{RcnaData} object containing the information related to a CNA search
    process, including database information.
  }
}
\details{
  This function queries the database referrenced from the \code{RcnaData}
  object and returns the section that contains the Edge list as defined
  by the VNA format as a \code{data.frame}s.

  The database filename is retrieved from \code{rcnadata$searchdata$filename}
  and opened at the beginning on the function. After that, the connection
  object is passed to the corresponding functions (\code{buildNodeData} and
  \code{buildTieData}), which in turn executes the queries and performs
  the tidying and transformation of the data. The connection to the database
  is closed at the end of the function.

  Note that, in the same fashion that happens for the \code{buildNodeData} and
  \code{buildTieData}, the strings on the dataset returned are converted to
  ASCII, replacing any non-ascii characters with '?' if neccessary.
}
\value{
  \code{data.frame} containing the edge list information.
}
\seealso{
  \code{\link{buildNodeData}}, \code{\link{buildTieData}},
  \code{\link{getAttributes}}
}
\keyword{ database }
