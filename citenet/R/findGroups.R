findGroups <- function( graff, r.walks=100 )
{
    
    # Note that more steps creates fewer groups, FE
    # 10 steps results in 6 groups
    # 100 steps results in 3 groups
    # 1000 steps results in 2 groups
    
    
    # To find the best membership structure from modularity:
    
    wtc <- walktrap.community(graff, modularity = TRUE, steps=r.walks)
    
    # plot(wtc$modularity)
    
    mx <- which(wtc$modularity == max(wtc$modularity))
    
    ctm <- community.to.membership(graff, wtc$merges, steps=mx)
    
    V(graff)$groups <- ( ctm$membership + 1 )
    
    return( graff )

}
