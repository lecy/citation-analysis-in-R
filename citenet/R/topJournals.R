topJournals <- function( rcna, setNum=10 )
{

    dat1 <- getAttributes( rcna )
    
    dat1$Journal <- toupper( dat1$Journal )
    
    tbl <- table( dat1$Journal )
    
    df1 <- data.frame( names(tbl), as.vector(tbl) )
    
    names( df1 ) <- c("Journal","Count")
    
    df1 <- df1[ -which( df1$Journal=="NA" ), ]
    
    df1 <- df1[ order( df1$Count, decreasing=T ), ]
    
    df2 <- df1[ 1:setNum, ]
    
    df2 <- df2[ order( df2$Count, decreasing=F ), ]

    dotchart(df2$Count,labels=df2$Journal, cex=.7,
             main="Top Journals in the Network",
             xlab="Frequency Count", pch = 19)
    

}
