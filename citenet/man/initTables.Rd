\name{initTables}
\alias{initTables}
\title{Initialize the Tables of a CNA Database}
\description{
  Initialize the \code{Publications} and \code{CitationRelationship} tables of
  a CNA database, creating them in case they do not exist on the database.
}
\usage{
initTables(conn)
}
\arguments{
  \item{conn}{
    \code{DBIConnection} object that correspond to a CNA database.
  }
}
\details{
  If the tables already exist on the database, the function does nothing.
  Otherwise, the tables with the following structure are created:
  \describe{
    \item{Publications}{
    \preformatted{
          BibtexKey,
          Type text,
          Title text,
          Author text,
          Journal text,
          Volume integer,
          Num integer,
          Pages text,
          Year integer,
          Publisher text,
          Cites text,
          CitedBy integer,
          Related text,
          SearchLevel integer,
          primary key (BibtexKey)}}
      \item{CitationRelationship}{
      \preformatted{
          Citation_ID integer,
          Publication_ID integer,
          primary key (Citation_ID, Publication_ID)}}
  }
}

\seealso{
  \code{\link{initDB}}
}
\keyword{ database }
\keyword{ internal }
