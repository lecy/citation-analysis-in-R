#
# Write the contents of the DB into an VNA file
#
writeVNA <- function(rcnadata, filename)
{
    if (rcnadata$searchdata$writeDB == T)
    {
        # get the file that contains the database
        dbfilename <- rcnadata$searchdata$filename
        writeVNAFromFile(dbfilename, filename)
    } else {
        # the search did not use the DB
        print("Error: the search did not use the DB")
    }
}


#
# Write the contents of the DB into an Pajek file
writePajek <- function(rcnadata, filename)
{
    if (rcnadata$searchdata$writeDB == T)
    {
        # get the file that contains the database
        dbfilename <- rcnadata$searchdata$filename
        writePajekFromFile(dbfilename, filename)
    } else {
        # the search did not use the DB
        print("Error: the search did not use the DB")
    }
}


#
# Write the contents of a DB (specified by its filename) into an VNA file
#
writeVNAFromFile <- function(dbfilename, filename)
{
    # open the database
    conn <- initDB(dbfilename)

    # open the file for writing
    vnafile <- file(filename, 'w', encoding="latin1")  # open an output file connection

    # node data
    nodedataheader <- buildNodeDataHeader()
    nodedata <- buildNodeData(conn)
    # remove double quotes
    nodedata$PubID <- gsub('"', '', nodedata$PubID)
    nodedata$Title <- gsub('"', '', nodedata$Title)
    nodedata$Author <- gsub('"', '', nodedata$Author)
    nodedata$Journal <- gsub('"', '', nodedata$Journal)
    nodedata$Publisher <- gsub('"', '', nodedata$Publisher)

    write(nodedataheader, file=vnafile)
    write.table(nodedata, file=vnafile, row.names=F, col.names=F, na='"N/A"')
    
    # tie data
    tiedataheader <- buildTieDataHeader()
    tiedata <- buildTieData(conn)
    # remove double quotes
    tiedata$Publication_ID <- gsub('"', '', tiedata$Publication_ID)
    tiedata$Citation_ID <- gsub('"', '', tiedata$Citation_ID)
    write(tiedataheader, file=vnafile)
    write.table(tiedata, file=vnafile, row.names=F, col.names=F, na='"N/A"')

    # close the file and the database
    close(vnafile)
    dbDisconnect(conn)

    return(T)
}


#
# Write the contents of a DB (specified by its filename) into an VNA file
#
writePajekFromFile <- function(dbfilename, filename)
{
    # open the database
    conn <- initDB(dbfilename)

    # open the file for writing
    netfile <- file(filename, 'w', encoding="latin1")  # open an output file connection

    # get the node data
    nodedata <- buildNodeData(conn)

    # vertices
    verticesheader <- buildVerticesHeader(nrow(nodedata))
    vertices <- as.data.frame(nodedata$PubID)
    # remove double quotes
    vertices[,'nodedata$PubID'] <- gsub('"', '', vertices[,'nodedata$PubID'])
    vertices$rownumber <- as.numeric(rownames(vertices))
    write(verticesheader, file=netfile)
    write.table(vertices[,c('rownumber','nodedata$PubID')],
                file=netfile, row.names=F, col.names=F, na='"N/A"')

    # arcs
    arcsheader <- buildArcsHeader()
    tiedata <- buildTieData(conn)
    # map to the vertices list
    f <- function(x) which(nodedata$PubID==x)
    arcs <- apply(tiedata, c(1,2),function(x) which(nodedata$PubID==x))[,c("Publication_ID", "Citation_ID")]

    write(arcsheader, file=netfile)
    write.table(arcs, file=netfile, row.names=F, col.names=F, na='"N/A"')

    # close the file and the database
    close(netfile)
    dbDisconnect(conn)

    return(T)
}


#
# Wrapper around the buildNodeData() function, so it accepts a
# rcnadata environment as the argument
#
getAttributes <- function(rcnadata)
{
    # open the database
    dbfilename <- rcnadata$searchdata$filename
    conn <- initDB(dbfilename)
    # call the function
    results <- buildNodeData(conn)
    # close the DB
    dbDisconnect(conn)

    return(results)
}


#
# Wrapper around the buildTieData() function, so it accepts a
# rcnadata environment as the argument
#
getEdgelist <- function(rcnadata)
{
    # open the database
    dbfilename <- rcnadata$searchdata$filename
    conn <- initDB(dbfilename)
    # call the function
    results <- buildTieData(conn)
    # close the DB
    dbDisconnect(conn)

    return(results)
}


#
# Build the node data header
#
buildNodeDataHeader <- function()
{
    str <- paste('*Node data',
                 'PubID, Title, Type, Author, Journal, Year, NumOfCitedBy, Publisher, SearchLevel',
                 sep='\n')

    return(str)
}


#
# Build the node data
#
buildNodeData <- function(conn)
{
    SQL_QUERY <- 'select PubID, Title, Type, Author, Journal,
        Year, CitedBy, Publisher, SearchLevel from Publications'

    # get the data from the DB
    results <- dbGetQuery(conn, SQL_QUERY)

    # cleanup the data, adding placeholders if needed
    #tryCatch({
        results[is.na(results$Year), "Year"] <- 0
        results[results$Year==0, "Year"] <- 9999
        results[is.na(results$Author), "Author"] <- 'NoAuthor'
        # replace NA in journals
        results[is.na(results$Journal), "Journal"] <- 'NA'
    #  },
    #  warning=function(e) {
    #    # ignore warnings for replacing empty variables
    #  },
    #  error=function(e) {
    #    # ignore warnings for replacing empty variables
    #  }
    #)

    # solve encoding issues
    d2 <- apply(results, c(1,2), function(x) iconv(x, 'UTF-8', 'ASCII', sub='?'))
    results[, c('PubID', 'Title', 'Author', 'Journal', 'Publisher')] <-
            d2[, c('PubID', 'Title', 'Author', 'Journal', 'Publisher')]

    return(results)
}


#
# Build the tie data header
#
buildTieDataHeader <- function()
{
    str <- paste('*Tie data',
                 'from to cited_by strength_of_tie',
                  sep='\n')

    return(str)
}


#
# Build the tie data
#
buildTieData <- function(conn)
{
    SQL_QUERY_1 <- 'select Publication_ID, Citation_ID from CitationRelationship'

    # get the data from the DB
    results <- dbGetQuery(conn, SQL_QUERY_1)
    
    # solve encoding issues
    results <- apply(results, c(1,2), function(x) iconv(x, 'UTF-8', 'ASCII', sub='?'))

    # append the cited_by and strength_of_tie as columns (always (1,1))
    results <- as.data.frame(results)
    results$cited_by <- 1
    results$strength_of_tie <- 1

    return(results)
}


#
# Build the Pajek vertices header
#
buildVerticesHeader <- function(n)
{
    str <- paste('*Vertices', n, sep=' ')

    return(str)
}


#
# Build the Pajek arcs header
#
buildArcsHeader <- function()
{
    str <- '*Arcs'

    return(str)
}

