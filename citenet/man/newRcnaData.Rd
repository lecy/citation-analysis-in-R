\name{newRcnaData}
\alias{newRcnaData}
\alias{RcnaData}
\title{Environment that Contains the Information of a CNA Search}
\description{
  Environment that contains the variables that store the information related
  to a CNA search. This includes the information related to the search
  session and the GUI (\code{sessionData}), information related to the sampling
  function and the current search process (\code{searchData}), and also
  information related to the database.
}
\usage{
newRcnaData(sessiondata, searchdata)
}
\arguments{
  \item{sessiondata}{
    \code{sessionData} object with information about the current search session
      and GUI.
  }
  \item{searchdata}{
    \code{searchData} object with information about the sampling function.
  }
}
\details{
  This function returns a new \code{RcnaData} environment. This environment
  contains all the information related to a CNA search, including information
  about the search session, the GUI, the sampling function and the database.
  It is returned by the main function (\code{cna.launchGui}), and is also
  the object passed to the main top level functions that export the database
  to VNA and Pajek files (\code{writeVNA} and \code{writePajek}).

  The following variables are available:
  \describe{
    \item{sessiondata}{\code{sessionData} object with the information
      related to the search session and GUI.}
    \item{searchdata}{\code{searchData} object with the information
      related to the sampling function.}
    \item{writeDB}{\code{logical} indicating whether the results of the
      should be written to a database or not.}
    \item{filename}{\code{character} vector containing the filename
      where the database is stored.}
  }

  The class of a \code{RcnaData} object is set to \dQuote{rcnadata} (in
  lowercase), but the object behaves the same way as a regular enviroment.
}
\value{
  \code{RcnaData} object with the values retrieved from the parameters.
}
\seealso{
  \code{\link{sessionData}}, \code{\link{searchData}}
}  
\keyword{ misc }
\keyword{ internal }
