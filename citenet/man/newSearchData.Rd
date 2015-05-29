\name{newSearchData}
\alias{newSearchData}
\alias{searchData}
\title{Environment that Contains the Information of a CNA Sampling Process}
\description{
  Environment that contains the information and state of a CNA sampling
  process.
}
\usage{
newSearchData(sessiondata)
}
\arguments{
  \item{sessiondata}{
    \code{sessionData} object that contains the information related to the
    search process from the GUI.
  }
}
\details{
  This function returns a new \code{searchData} environment. It contains
  the information related to a CNA sampling process, including the articles
  stored on each level, the list of articles retrieved, information relative
  to the database, the \code{sessionData} object that initiated the search,
  and the start date of the search.

  The following variables are available:
  \describe{
    \item{sessiondata}{\code{sessionData} object containing the information
    related to the search session, built from the values input by the user
    on the GUI.}
    \item{date}{\code{character} string containing the date when the search
    was started, as returned by the \code{date} function.}
    \item{levels}{\code{array} of #\code{sessiondata$stopLevel+1} levels, each
    one corresponding to one of the levels of the sampling process. Each of the
    level consists as well as an \code{array} of \code{MdlBibInfo} objects, one
    for each article on the level.}
    \item{articles}{\code{array} of \code{MdlBibInfo} objects, containing the
    articles that are succesfully processed and ready to be stored into the
    database after the second pass of the sampling function.}
    \item{writeDB}{\code{logical} indicating if the contents of the articles
    should be stored into the database. Usually \code{TRUE} except for
    debugging purposes.}
    \item{filename}{\code{character} string containing the filename where the
    database is stored.}
  }

  The variables stored in this environment are modified by the
  \code{cna.startSamplingProcess} function. When the object is initalized, the seeds
  stored in the \code{sessiondata} object are stored as level 0 articles, and
  the database filename is retrieved from that object as well.
}
\value{
  A new \code{searchData} object with the default values.
}
\seealso{
  \code{\link{sessionData}}, \code{\link{RcnaData}}
}
\keyword{ misc }
\keyword{ internal }
