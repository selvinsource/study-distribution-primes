#The harmonic series 1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6 + ... diverges
#p17

options(digits=20)

if(TRUE){
  f <- function(x) {
    y <- x
    y[1] <- 1
    for(i in 2:length(x)){
      y[i] <- 1/x[i] + y[i-1]
    }
    return(y)
  }
  x <- c(1:1000)
  y <- f(x)
  plot(x,y,type="l")
  title("Harmonic series diverges")
}

#recursion is slow
if(FALSE){
  f <- function(x) if(x==1) 1 else 1/x + f(x-1)
  x <- c(1:1000)
  y <- sapply(x,f)
  plot(x,y,type="l")
  title("Harmonic series diverges")
}
