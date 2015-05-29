#
# Inits the database
#
initDB <- function(filename='rcna.sqlite')
{
    # create the directory, if needed
    tryCatch(
        {
            dir.create(dirname(filename), recursive=T)
        },
        warning=function(e){
            # directory was already created
        }
    )

    conn <- dbConnect(SQLite(), dbname=filename)
    initTables(conn)

    return(conn)
}

#
# Creates the tables needed, in case they do not exist
# BibtexKey (as in titleYEARauthor) is used as the primary key, instead of
# using numeric IDs as in the original program
#
initTables <- function(conn)
{
    SQL_PUBLICATIONS  <-
        'create table Publications (
          BibtexKey text,
          PubID text,
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
          primary key (BibtexKey, Title))'
    
    SQL_CITATIONRELATIONSHIP <-
        'create table CitationRelationship (
          Citation_ID text,
          Publication_ID text,
          primary key (Citation_ID, Publication_ID))'
    
    SQL_HEADER <-
        'create table header (
          key varchar(64),
          value varchar(64))'

    # create the tables if needed
    if (!dbExistsTable(conn, 'Publications'))
        dbGetQuery(conn, SQL_PUBLICATIONS)
    
    if (!dbExistsTable(conn, 'CitationRelationship'))
        dbGetQuery(conn, SQL_CITATIONRELATIONSHIP)

    if (!dbExistsTable(conn, 'header'))
        dbGetQuery(conn, SQL_HEADER)

    return
}


#
# Create a RcnaData object from a SQLite database. The resulting RcnaData
# object will not be complete, but still valid for generating the
# citation network.
#
loadDatabase <- function(dbfilename)
{
    sessiondata <- newSessionData()
    sessiondata$dbFilename <- dbfilename
    
    # update the fields if the sqlite file is from the newer version
    conn <- dbConnect(SQLite(), dbname=sessiondata$dbFilename)
    if (dbExistsTable(conn, 'header'))
    {
        SQL_QUERY <- 'select * from header'
        
        # get the data from the DB
        header <- dbGetQuery(conn, SQL_QUERY)
        
        sessiondata$keywords = header[header$key=="query",]$value
        sessiondata$stopLevel = as.numeric(header[header$key=="max_level",]$value)-1
        if (header[header$key=="use_percent",]$value == "1") {
            sessiondata$samplingPerLevel = rep(as.numeric(header[header$key=="max_number",]$value),
                    sessiondata$stopLevel)
        } else {
            sessiondata$candidateLimit = rep(as.numeric(header[header$key=="maxpl",]$value),
                    sessiondata$stopLevel)
        }
    }
    dbDisconnect(conn)
    
    searchdata <- newSearchData(sessiondata)
    searchdata$writeDB <- TRUE

    rcnadata <- newRcnaData(sessiondata, searchdata)

    return(rcnadata)
}


#
# Return the number of articles in a database file
#
getNumberOfEntries <- function(dbfilename)
{
    SQL_QUERY_1 <- "select COUNT(*) as Publications from Publications"
    SQL_QUERY_2 <- "select COUNT(*) as CitationRelationship from CitationRelationship"

    conn <- initDB(dbfilename)
    resultsPub <- dbGetQuery(conn, SQL_QUERY_1)
    resultsCit <- dbGetQuery(conn, SQL_QUERY_2)
    dbDisconnect(conn)

    return (c(resultsPub, resultsCit))
}
