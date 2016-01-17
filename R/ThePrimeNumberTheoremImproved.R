#The Prime Number Theorem Improved: π(N) ~ Li(N)
#Li(N) is the log integral function (integral of 1/logN)
#π(N) is the count of the number of primes up to a quantity
#p116
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

x <- seq(10,1000,by=1)
y1 <- sapply(x,π)
y2 <- sapply(x,Li)
y3 <- x/log(x)
plot(x,y1,type="l",col="blue",ann=FALSE)
lines(x,y2,type="l",col="green")
lines(x,y3,type="l",col="orange")
lines(x,abs(y2 - y1)/y1*100, col="pink")
lines(x,abs(y3 - y1)/y1*100, col="red")
title("The Prime Number Theorem Improved",xlab="N values",ylab="π(N)=blue, Li(N)=green, N/log(N)=orange, Li(N) error=pink, N/log(N) error=red")