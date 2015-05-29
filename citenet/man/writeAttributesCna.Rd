\name{writeAttributesCna}
\alias{writeAttributesCna}
\title{Create an Spreadsheet of Article Data from an RcnaData Object}
\description{  
  Writes a .csv file that can be opened in Excel.  It contains all of
  the node (article) data in the database, i.e. an attributes file.
}
\usage{writeAttributesCna( rcnadata, fileName="CNA.csv" )}

\arguments{
\item{rcnadata}{A cna database.}
\item{fileName}{The name of the .csv file created in your directory.}
}
\details{
  If you would like the node ID's from the \code{easyPlot} functions use the
  twin \code{writeAttibutesIgraph} function to include the ID that is printed
  on the plots.
}
\value{
  Nothing returned
}
\seealso{
\code{\link{writeAttributesIgraph}}, \code{\link{easyPlot}},
\code{\link{getAttributes}}, \code{\link{getEdgelist}}
}

\examples{
data( Noruzi2005 )
writeAttributesCna( Noruzi2005 )
}
