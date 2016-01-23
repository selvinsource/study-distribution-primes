#The series 1 + 1/2 + 1/4 + 1/8 + 1/16 + 1/32 + ... converges to 2
#p17
#for formulae images use http://www.sciweavers.org/free-online-latex-equation-editor

options(digits=20)

if(TRUE){
  f <- function(x) {
    y <- x
    y[1] <- 1
    for(i in 2:length(x)){
      y[i] <- 1/2^x[i-1] + y[i-1]
    }
    return(y)
  }
  x <- c(1:1000)
  y <- f(x)
  plot(x,y,type="l")
  title("The series converges to 2")
}

#recursion is slow
if(FALSE){
  f <- function(x) if(x==1) 1 else 1/2^(x-1) + f(x-1)
  x <- c(1:1000)
  y <- sapply(x,f)
  plot(x,y,type="l")
  title("The series converges to 2")
}
