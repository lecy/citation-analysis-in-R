\name{cnaToIgraph}
\alias{cnaToIgraph}
\title{Translate a Cna Database to a Network Object}
\description{
  The \code{cnaToIgraph} function takes a citation database and translates it
  to an igraph network object for the purpose of network analysis.
}
\usage{cnaToIgraph( rcnadata )}
\arguments{
  \item{rcnadata}{A cna database object.}
}
\details{
  The \code{cnaToIgraph} function creates an igraph network object from a cna database.
  An igraph object has some features that are similar to a data.frame object. 
  The attributes can be listed by:

  \code{list.vertex.attributes( graff )}

  To see an attribute in vector form, do not use \code{g$Title}, but instead you can use:

  \code{V(g)$Title}

  To set values of an attribute, use:

  \code{V(g)[ V(g)$Year < 1900 ]$Year <- NA}

  To create a new attribute:

  \code{V(g)$economics <- 0}

  \code{V(g)[ V(g)$Journal == "Econometrics" | "Journal of Economics Review" ]$economics <- 1}
}
\value{
  Returns an igraph network object.
}
\seealso{
  \code{\link{cnaToSna}}, \code{\link{igraphToSna}},
  \code{\link{writeVNA}}, \code{\link{writePajek}}
}
\examples{
data( Noruzi2005 )
g <- cnaToIgraph( Noruzi2005 )
summary( g )
easyPlot( g, TRUE, TRUE )

# The plot function looks for a "color" attribute by default.
# Use it to highlight features of the network.
easyPlot( g, TRUE )
V(g)$color <- "light blue"
V(g)[ V(g)$Journal == "Scientometrics"  & !is.na(V(g)$Journal) ]$color <- "red"
easyPlot( g, TRUE )

V(g)$color <- V(g)$SearchLevel + 1
easyPlot( g, TRUE )
}

