#
# Environment that holds all the information relevant to a search, including
# searchData, sessionData, and the filename of the DB
#
newRcnaData <- function(sessiondata, searchdata)
{
    .e <- new.env(parent=globalenv())
    
    .e$sessiondata <- sessiondata
    .e$searchdata <- searchdata
    .e$writeDB <- searchdata$writeDB
    .e$filename <- searchdata$filename
    
    class(.e) <- 'rcnadata'
    
    return(.e)
}

#
# Return a list containing a summary of the search results
#
summary.rcnadata <- function(object, ...)
{
    ret <- list()
    
    ret[["creation date"]] <- object$searchdata$date
    ret[["database filename"]] <- object$filename
    # seed articles
    ret[["seed articles"]] <- object$sessiondata$seeds
    # search parameters
    search <- list()
    search[["stop level"]] <- object$sessiondata$stopLevel
    search[["sampling per level"]] <- object$sessiondata$samplingPerLevel
    search[["articles cap"]] <- object$sessiondata$articlesCap
    search[["check minimum cites"]] <- object$sessiondata$checkCitedMin
    if (object$sessiondata$checkCitedMin)
        search[["minimum cites"]] <- object$sessiondata$citedMin
    search[["check year range"]] <- object$sessiondata$checkYears
    if (object$sessiondata$checkYears) {
        search[["minimum year"]] <- object$sessiondata$yearMin
        search[["maximum year"]] <- object$sessiondata$yearMax
    }
    ret[["search parameters"]] <- search
    # database information
    if (file.exists(object$filename))
    {
        tryCatch(
            {
                counts <- getNumberOfEntries(object$filename)
                ret[["publications on DB"]] <- counts$Publications
                ret[["relationships on DB"]] <- counts$CitationRelationship
            },
            error=function(e) {}
        )
    }
    
    return(ret)
}


#
# environment that hold the information needed to keep track of the state
# of the search process. The following variables are defined:
# currentStep - step we are currently in
# keywords - vector of the keywords used for searching the candidates. When
#    the user clicks on the "New Keywords" button on step 2, the new keyword
#    is appended to the list, in order to keep track of all the searches made
# offset - number of the first article to retrieve (for "More results")
# candidateLimit
# seedCandidates
# seeds
# stopLevel - maximum level to stop
# samplingPerLevel - vector of stopLevel entries, with sampling per each level
# checkCitedMin - if TRUE, apply min # of times cited filter
# citedMin - min # of times cited
# checkYears - if TRUE, apply published between years filter
# yearMin
# yearMax
#
newSessionData <- function(debug=F)
{
    .e <- new.env(parent=globalenv())
    .e$currentStep <- 0
    # step 1
    .e$keywords <- NULL
    .e$candidateLimit <- 10
    # step 2
    .e$seedCandidates <- NULL
    .e$seeds <- NULL
    .e$offset <- 0
    # step 3
    .e$stopLevel <- 3
    .e$samplingPerLevel <- NULL
    .e$articlesCap <- 1000
    .e$checkCitedMin <- F
    .e$citedMin <- 0
    .e$checkYears <- F
    .e$yearMin <- 2005
    .e$yearMax <- 2010
    
    # db
    .e$dbFilename <- 'rcna.sqlite'
    
    # return information
    .e$tclResult <- NULL
    .e$tt <- NULL
    
    # debugging
    .e$debug <- debug
    
    # functions
    #.e$nextPrevStepAction <- function(...) nextPrevStepAction(...)
    #.e$executeNextStep <- function(...) executeNextStep(...)
    
    class(.e) <- 'sessiondata'
    
    return(.e)
}

#
# Create a new SearchData.
#
newSearchData <- function(sessiondata)
{
    .e <- new.env(parent=globalenv())
    .e$sessiondata <- sessiondata
    .e$date <- date()
    .e$levels <- array(data=list(), dim=sessiondata$stopLevel+1)
    # add the seeds to level 0 (levels[[1]] in R)
    .e$levels[[1]] <- sessiondata$seeds
    if (!is.null(.e$levels[[1]] ))
        .e$levels[[1]][,"searchLevel"] <- 0
    
    # resulting list of articles
    .e$articles <- NULL
    
    # database related
    .e$writeDB <- F
    .e$filename <- sessiondata$dbFilename
    
    class(.e) <- 'searchdata'
    
    return(.e)
}
