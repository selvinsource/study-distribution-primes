#The Basel Problem: 1 + 1/2^2 + 1/3^2 + 1/4^2 + 1/5^2 + 1/6^2 + ... converges to pi^2/6
#p63
options(digits=20)

f <- function(x,power) {
  y <- x
  y[1] <- 1
  for(i in 2:length(x)){
    y[i] <- 1/x[i]^power + y[i-1]
  }
  return(y)
}

x <- c(1:1000)
y <- f(x,2)
plot(x,y,type="l")
abline(h=pi^2/6,col="green")
title("The Basel Problem")
