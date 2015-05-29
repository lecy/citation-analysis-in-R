\name{writeAttributesIgraph}
\alias{writeAttributesIgraph}
\title{  
Create an Spreadsheet of Article Data from an Igraph Object
}
\description{  
  Writes a .csv file that can be opened in Excel. It contains all of the
  node (article) data in the database, i.e. an attributes file.
}

\usage{writeAttributesIgraph( graff, fileName="CNA.csv" )}

\arguments{
\item{graff}{An igraph network object.}
\item{fileName}{the name of the .csv file to be created in your directory.}
}

\details{
  This function will create a data set with one column for each node attribute,
  including the ID that is used for the plot functions.
}
\value{
  Nothing returned.
}
\seealso{
  \code{\link{writeAttributesCna}}, \code{\link{easyPlot}},
  \code{\link{getAttributes}}, \code{\link{getEdgelist}}
}
\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
easyPlot( g, graph.layout=TRUE )
writeAttributesIgraph( g )
}
