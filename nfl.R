dk <- read.csv("nflredux")
dk <- lapply(split(dk, dk$Position), function(x) x[sample(15), ])
dk <- dk[c("G","W","C","D","U")]

15*choose(15,3)*choose(15,2)*choose(4,2)*4
rows <- list(t(1:15), combn(15,3), combn(15,2), combn(4,2), t(1:4))
dims <- sapply(rows, NCOL)
inds <- expand.grid(mapply(`:`, 1, dims))
dim(inds)



extract <- function(ind) {
    g <- inds[ind,]
    do.call(rbind, lapply(1:5, function(i) dk[[i]][rows[[i]][,g[[i]]], ]))
}

extract(1)



win <- c(0, 0, 0)
for(i in 1:17000000)
{

    extracted <- extract(i)
    #print(i)
    #print(sum(extracted$Price))
    if(sum(extracted$Price) < 50000){
        if(win[3] < sum(extracted$Points)){
            #print(sum(extracted$Points))
            win <- c(i, sum(extracted$Price), sum(extracted$Points))
            print(win)
            print(extracted)
        }
    }
}


print(win
