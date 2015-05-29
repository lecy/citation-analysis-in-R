topAuthors <- function( rcnadata, setNum=10 )
{

    par( mfrow=c(2,2) )
    
    # GRAPH ONE - APPEARANCE FREQUENCY
    
    dat1 <- getAttributes( rcnadata )
    
    dat1$Author <- toupper( dat1$Author )
    
    tb1 <- table( dat1$Author )
    
    auth.count <- as.vector(tb1)
    
    df1 <- data.frame( names(tb1), as.vector(tb1) )
    
    names( df1 ) <- c("Author","Count")
    
    df1 <- df1[ order( df1$Count, decreasing=T ), ]
    
    df2 <- df1[ 1:setNum, ]
    
    df2 <- df2[ order( df2$Count, decreasing=F ), ]

    dotchart(df2$Count,labels=df2$Author, cex=.7,
             main="Author Frequency",
             xlab="Frequency Count", pch = 19)
    
    
    # GRAPH TWO - TOTAL CITATION COUNT
    
    
    tb2 <- tapply( dat1$CitedBy, dat1$Author, sum )
    
    df3 <- data.frame( names(tb2), as.vector(tb2) )
    
    names( df3 ) <- c("Author", "TotalCites" )
    
    df3 <- df3[ order( df3$TotalCites, decreasing=T ), ]
    
    df4 <- df3[ 1:setNum, ]
    
    df4 <- df4[ order( df4$TotalCites, decreasing=F ), ]

    dotchart(df4$TotalCites,labels=df4$Author, cex=.7,
             main="Total Number of Citations",
            xlab="Sum of All Cites", pch = 19)
    
    
    # GRAPH THREE - AVERAGE CITATIONS PER ARTICLE
    
    ave.cites <- as.vector(tb2 / tb1)
    
    df5 <- data.frame( names(tb2), ave.cites )
    
    names( df5 ) <- c("Author", "AveCites" )
    
    df5 <- df5[ order( df5$AveCites, decreasing=T ), ]
    
    df6 <- df5[ 1:setNum, ]
    
    df6 <- df6[ order( df6$AveCites, decreasing=F ), ]
    
    dotchart(df6$AveCites,labels=df6$Author, cex=.7,
             main="Ave Cites Per Publication",
            xlab="Ave Cites", pch = 19)
    
    
    # GRAPH FOUR - CITES BY NUMBER PUBLISHED
    
    plot( log(ave.cites+1) ~ as.factor(auth.count), main="Ave Cites by Frequency",
          xlab="Author Frequency", ylab="Log Ave Num of Cites", ylim=c(0, max(log(ave.cites))) )
    
    
    text( 1:length(unique(auth.count)), rep(1,length(unique(auth.count))),
          round(tapply(ave.cites,auth.count,mean),0), col="red", cex=0.8 )
    

}
