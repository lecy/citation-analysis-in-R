\name{buildNodeData}
\alias{buildNodeData}
\alias{buildTieData}
\alias{buildNodeDataHeader}
\alias{buildTieDataHeader}
\alias{buildVerticesHeader}
\alias{buildArcsHeader}
\title{Return the Information from a CNA Database as VNA or Pajek sections}
\description{
  Return the information stored on a CNA database as the different sections
  of the VNA or Pajek format.
}
\usage{
buildNodeData(conn)
buildTieData(conn)
buildNodeDataHeader()
buildTieDataHeader()
buildVerticesHeader(n)
buildArcsHeader()
}
\arguments{
  \item{conn}{
    \code{DBIConnection} object that correspond to a CNA database.
  }
  \item{n}{
    Number of publications present on the database
  }
}
\details{
  These functions query the database and return the different sections that 
  comprise a VNA or Pajek file. The \code{conn} object should be an already
  opened \code{DBIConnection} object.

  \code{buildNodeData} and \code{buildTieData} execute the appropiate queries
  against the database, and return \code{data.frame} objects that contain the
  results. The strings on the resulting objects are converted to ASCII, and
  the \code{Year} and \code{Author} fields are processed in order to replace
  empty (NA) values with the appropiate placeholders.

  \code{buildNodeDataHeader} and \code{buildTieDataHeader} return the header
  lines for the VNA sections as character strings. \code{buildVerticesHeader}
  and \code{buildArcsHeader} return the header lines fot the Pajek sections.
}
\value{
  \code{data.frame} object with the results, in the case of 
    \code{buildNodeData} and \code{buildTieData}.

  Character strings in the case of \code{buildNodeDataHeader},
  \code{buildTieDataHeader}, \code{buildNodeDataHeader} and 
  \code{buildTieDataHeader}.
}

\seealso{
  \code{\link{writeVNA}}, \code{\link{writePajek}}, \code{\link{initDB}}
}

\keyword{ database }
\keyword{ internal }
