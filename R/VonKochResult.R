#Von Koch's 1901 Result: π(x) = Li(x) + O(sqrt(x) * logx)
#π(N) is the count of the number of primes up to a quantity
#Li(N) is the log integral function (integral of 1/logN)
#p237
library(numbers)
options(digits=20)

integrand <- function(x) {1/log(x)}
Li <- function(x) {
  if(x < 1){
    negativearea <- integrate(integrand, lower = 0, upper = x)
    return (as.numeric(negativearea[1]))
  }
  else if (x > 1){
    negativearea <- integrate(integrand, lower = 0, upper = 0.9)
    positivearea <- integrate(integrand, lower = 1.1, upper = x)
    return (as.numeric(positivearea[1])+as.numeric(negativearea[1]))
  }
  else
    return (-10);
}

π <- function(x){
  y <- Primes(x) 
  return (length(y))
}

x <- seq(10,10000,by=1)
y1 <- sapply(x,π)
y2 <- sapply(x,Li)
y3 <- sqrt(x) * log(x)
#Lowell Schoenfeld constant 1/(8*pi)
plot(x,1/(8*pi)*y3,type="l",col="blue",ann=FALSE)
lines(x,abs(y1-y2), col="red")
title("Von Koch's 1901 Result",xlab="x values",ylab="π(x)-Li(x)=red, O(sqrt(x)*logx)=blue")