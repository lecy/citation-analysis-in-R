\name{initDB}
\alias{initDB}
\title{Open and Initialize a CNA SQLite database}
\description{
  Open a CNA SQLite database, creating the \code{Publications} and
  \code{CitationRelationship} tables if they do not exist.
}
\usage{
initDB(filename = "rcna.sqlite")
}
\arguments{
  \item{filename}{
    \code{Character} vector containing the name of the filename where the
      database will be stored.
  }
}
\details{
  This function opens a SQLite database located at \code{filename}, and creates
  the \code{Publications} and \code{CitationRelationship} if they do not exist
  previously.

  The \code{filename} parameter can contain a full or partial path name: if it
  is the case and the path does not exist, the function attemps to create the
  directory recursively.

  If this function is invoked directly, please make sure that the returned
  database object is closed explicitly by the SQLite \code{dbDisconnect}
  function when it is no longer needed, as it is not done automatically.
}
\value{
  \code{DBIConnection} object that correspond to the CNA database stored at
  the specified filename.
}
\seealso{
  \code{\link{initTables}}
}
\keyword{ database }
\keyword{ internal }
