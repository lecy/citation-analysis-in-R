\name{writePajek}
\alias{writePajek}
\alias{writePajekFromFile}
\title{Export the Contents of a CNA Database as a Pajek File}
\description{
  Export the contents of a CNA database as a Pajek file, containing
  the relations between the publications stored into the database.
}
\usage{
writePajek(rcnadata, filename)
writePajekFromFile(dbfilename, filename)
}
\arguments{
  \item{rcnadata}{
    \code{RcnaData} object, as returned by the search.
  }
  \item{filename}{
    Character string naming the file to write to.
  }
  \item{dbfilename}{
    Character string naming the file that contains the database.
  }
}
\details{
  \code{writePajek} retrieves the database filename from
  the \code{rcnadata} object automatically, and produce a filename on Pajek
  format.

  \code{writePajekFromFile} receives the name of
  the database, instead of an \code{rcnadata} object, and can be used instead
  of the above functions directly avoiding the user to launch a new search.

  The resulting Pajek file vertices contain the \code{BibtexKey}. The
  Pajek arcs contain the row number of the source publication and
  the destination publication.

  Before the contents of the database are written to the file, the strings are
  coerced into ASCII encoding, in order to maintain compatibility with the VNA
  and Pajek readers. The non-ascii characters, such as accented letters or 
  gliphs, are converted to \dQuote{?}. Also, the double quotation marks are
  removed from the final output, in order to prevent conflicts.
}
\value{
  \code{TRUE} on succesfull completion of the function.
}
\seealso{
  \code{\link{newRcnaData}}, \code{\link{buildNodeData}},
  \code{\link{writeVNA}}
}
\examples{
data( Noruzi2005 )
writeVNA( Noruzi2005, "noruzi2005.net")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ IO }
\keyword{ database}
