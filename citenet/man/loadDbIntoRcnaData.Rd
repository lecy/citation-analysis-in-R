\name{loadDatabase}
\alias{loadDatabase}
\title{Create a RcnaData Object from a Database File}
\description{
  Create a RcnaData object from a previous SQLite database file.
}
\usage{
loadDatabase(dbfilename)
}
\arguments{
  \item{dbfilename}{
    \code{character} vector containing the name of the database file.
  }
}
\details{
  This function returns a \code{RcnaData} object created from a previously
  generated CNA SQLite database. The resulting object does not have the 
  usual information a regular \code{RcnaData} object contains (for example,
  the parameters used for the search, or the articles returned from the
  search): it only contains the name of the filename, and the rest of the
  fields will contain default, non useful values.

  It is intented as a convenient way of passing already existing database
  files to the citation network generation functions, such as 
  \code{writeVNA} and \code{writePajek}. Usage of the returned
  \code{RcnaObject} on other functions is not recommended, and will probably
  result in errors or unexpected results.
}
\value{
  \code{RcnaData} object containing only the database filename, all of the
  other fields will be set to their defaults. 
}
\seealso{
  \code{\link{RcnaData}}, \code{\link{writeVNA}}, \code{\link{writePajek}}
}
\keyword{ ~database }
