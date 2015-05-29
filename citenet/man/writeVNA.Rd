\name{writeVNA}
\alias{writeVNA}
\alias{writeVNAFromFile}
\title{Export the Contents of a CNA Database as a VNA File}
\description{
  Export the contents of a CNA database as a VNA file, containing
  the relations between the publications stored into the database.
}
\usage{
writeVNA(rcnadata, filename)
writeVNAFromFile(dbfilename, filename)
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
  \code{writeVNA} retrieves the database filename from
  the \code{rcnadata} object automatically, and produce a filename on VNA 
  format.

  \code{writeVNAFromFile} receives the name of
  the database, instead of an \code{rcnadata} object, and can be used instead
  of the above functions directly avoiding the user to launch a new search.

  The resulting VNA file nodes consist of the following fields:
  \preformatted{BibtexKey, Title, Type, Author, Journal, Year, NumOfCitedBy, 
  Publisher, SearchLevel}

  The VNA tie data contains the following fields:
  \preformatted{from, to, cited_by, strength_of_tie}

  where \code{cited_by} and \code{strength_of_tie} default to (1,1).
  If the database contains NA values they are replaced with the string 
  \dQuote{N/A}, except for the \code{Year} field, where the placeholder 
  \code{9999} is used instead, and for the \code{Author} field, where the
  \dQuote{NoAuthor} is used.

  Before the contents of the database are written to the file, the strings are
  coerced into ASCII encoding, in order to maintain compatibility with the VNA
  and Pajek readers. The non-ascii characters, such as accented letters or 
  gliphs, are converted to \dQuote{?}. Also, the double quotation marks are 
  removed from the final output, in order to prevent conflicts..
}
\value{
  \code{TRUE} on succesfull completion of the function.
}
\seealso{
  \code{\link{newRcnaData}}, \code{\link{buildNodeData}},
  \code{\link{writePajek}}
}
\examples{
data( Noruzi2005 )
writeVNA( Noruzi2005, "noruzi2005.vna")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ IO }
\keyword{ database}
