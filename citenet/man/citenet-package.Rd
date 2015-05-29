\name{citenet-package}
\alias{citenet-package}
\alias{citenet}
\docType{package}
\title{
Citation Network Analyzer
}
\description{
Citation Network Analyzer is a program for generating and analyzing
compact networks of citation relationships between academic publications.
}
\details{
\tabular{ll}{
Package: \tab citenet\cr
Type: \tab Package\cr
Version: \tab 0.3-5\cr
Date: \tab 2015-05-28\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab no\cr
}

Citation Network Analyzer (citenet/CNA) generates and analyzes compact networks
of citation relationship between academic publications. The details of the
publications are retrieved from Google Scholar and stored into a SQLite
database, and their relationship can be exported as VNA and Pajek files.

Previous versions included a graphical user interface for gathering the data
and generating the SQLite file, but it has been deprecated and removed since
version 0.3-5 in favour of a more up to date tool outside the package. In case
you have not received the scrapping tool along with this package, it can be
found at \url{https://github.com/lecy/}.

Once the sampling process is completed, the resulting publications and the
relationships between those publications are stored into a database. The
\code{\link{writeVNA}} and \code{\link{writePajek}} functions can be used to
export the contents of the database to VNA or Pajek files respectively. The
contents of the database can also be retrieved as \code{data.frame} objects by
using the \code{\link{getAttributes}} and \code{\link{getEdgelist}} functions.

The package uses \code{\link{RcnaData}} object to store all the information
related to a search session, including the parameters of the search, the
location of the database file, and the articles stored for each level. This
objects acts essentially as a citation database, but in order to perform
analysis the database is translated info a network object. Please refer to
the documentation page of \code{\link{RcnaData}} for more details about how
to use this object.

The package includes also a number of functions that allow the user to
perform analysis over the resulting citation networks, plot the results in
different ways and convert among the different formats used by the \code{sna}
, \code{network} and \code{igraph} packages.
}
\section{Included datasets}{
The package includes two sample datasets, each one consisting of a 
\code{RcnaData} object and its related \code{SQLite} files, resulting of
invoking the data gathering tool with the seed publications:

\itemize{
  \item{\dQuote{Google Scholar: The new generation of citation indexes} by
    Noruzi, A.(2005), and}
  \item{\dQuote{The use of citation data in writing the history of
  science} by Garfield, E. and others (1964)}
}

As an example, the first dataset can be loaded with the command:

\code{data(Noruzi2005, package="citenet")}

and results in the object \code{Noruzi2005} being created. This object can be
passed to the \code{getAttributes}, \code{getEdgelist}, \code{writeVNA} or
\code{writePajek} functions in order to produce the desired results:

\preformatted{library(citenet)
getAttributes(Noruzi2005)
getEdgelist(Noruzi2005)
writeVNA(Noruzi2005, filename="Noruzi2005.vna")
writePajek(Noruzi2005, filename="Noruzi2005.net")}
}
\note{
The original name of this package was \code{CNA}, but since version 0.3-5 it
has been renamed to \code{citenet} in order to prevent conflicts with the
\code{CRAN} package "CNA - A Package for Coincidence Analysis"
(\url{http://cran.r-project.org/package=cna}).

As such, both the documentation and the R code might still contain references
to \code{CNA}. Please be aware that, in all cases, they refer to this package.

\author{
Jesse Lecy <jdlecy@gmail.com>

Maintainer: Jesse Lecy <jdlecy@gmail.com>

Contributor: Diego Moreda <diego.plan9@gmail.com>
}
\keyword{ package }
