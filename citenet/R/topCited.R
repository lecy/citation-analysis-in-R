topCited <- function( rcnadata, setNum=10 )
{

    dat1 <- getAttributes( rcnadata )
    
    dat1 <- dat1[ order(dat1$CitedBy, decreasing=T), ]
    
    dat2 <- dat1[ 1:setNum , ]
    
    
    cites <- dat2$CitedBy
    

    dat2 <- dat2[ order(dat2$CitedBy, decreasing=F), ]
    
    namez <- paste( toupper( dat2$Author ), " (", dat2$Year, ")", sep="")
    
    dotchart(dat2$CitedBy,labels=namez,cex=.7,
             main="Top Highly Cited Articles",
             xlab="Citation Count", pch = 19)
    
    print( dat2 )

}
