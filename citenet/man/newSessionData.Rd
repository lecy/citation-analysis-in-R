\name{newSessionData}
\alias{newSessionData}
\alias{sessionData}
\title{Environment that Contains the State of a CNA Search Session}
\description{
  Environment that contains the variables that reflect the state of the
  current CNA search session.
}
\usage{
newSessionData(debug = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{debug}{
    \code{logical} that turns on/off debugging behaviour.
  }
}
\details{
  This function returns a new \code{sessionData} environment. This environment
  contains the information needed for representing a CNA search session, 
  containing the parameters used for the search, the database filename 
  information, and additional information related to the state of the GUI.

  The following variables are available:
  \describe{
    \item{currentStep}{GUI step that is currently being executed.}
    \item{keywords}{\code{vector} of search keywords used for searching
      for candidates. When the user clicks on the \dQuote{New keywords} button
      on step 2, the new keyword is appended to the end of the list.}
    \item{candidateLimit}{\code{numeric} containing the maximum
      number of candidates to be retrieved.}
    \item{seedCandidates}{\code{array} containing the current seed
      candidates.}
    \item{seeds}{\code{array} containing the current seeds selected.}
    \item{offset}{\code{numeric} containing the index of the first
      candidate article to be retrieved from Scholar, used by the 
      \dQuote{More results} functionality.}
    \item{stopLevel}{\code{numeric} containing the maximum level of
      articles processed on the search.}
    \item{samplingPerLevel}{\code{vector} containing the sampling level
      used for each level, with #\code{stopLevel} elements.}
    \item{articlesCap}{\code{numeric} containing the maximum number of
      subarticles that are retrieved from a single article.}
    \item{checkCitedMin}{\code{logical} indicating if the minimum number
      of times filter is selected.}
    \item{checkYears}{\code{logical} indicating if the years between
      filter is selected.}
    \item{yearMin}{\code{numeric} containing the earliest year for the
      years filter.}
    \item{yearMax}{\code{numeric} containing the latest year for the
      years filter.}
    \item{dbFilename}{\code{character} vector containing the filename
      where the database will be stored.}
    \item{tclResult}{\code{tclVar} that is used for controlling whether
      the GUI has been completed.}
    \item{tt}{Tcl/tk handler of the current dialog window.}
    \item{debug}{\code{logical} indicating if the debugging behaviour
      is used or not.}
  }

  This environment is passed onto the GUI related functions, and the values of
  their variables are modified as a result of the values input by the user on
  the interface. The function \code{nextPrevStepAction} is where the assignment
  of the variables takes place, acting as a layer of translation between the
  GUI values (stored in \code{tclVars}) and the actual variables.

  The class of a \code{sessionData} object is set to \dQuote{sessiondata} (in
  lowercase), but the object behaves the same way as a regular enviroment.
}
\value{
  \code{sessionData} object with the default values for each variable.
}
\keyword{ misc }
\keyword{ internal }
