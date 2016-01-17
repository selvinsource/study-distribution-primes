#The Prime Number Theorem: N/π(N) ~ logN or π(N) ~ N/logN
#p45
library(numbers)
#N/π(N)
f <- function(x){
  y <- Primes(x) 
  return (x/length(y))
}
#x <- c(1000,1000000,1000000000)
x <- c(10,100,1000,10000,100000,1000000)
y1 <- sapply(x,f)
y2 <- sapply(x,log)
plot(x,y1,type="l",col="blue",ann=FALSE)
lines(x,y2,type="l",col="green")
lines(x,abs(y2 - y1)/y1*100, col="red")
title("The Prime Number Theorem",xlab="N values",ylab="N/π(N) = blue, logN = green, %error = red")

#Consequences
#p46
#in the neighborhood of a big number N, the probability of being prime is 1/Log(N)
#N-th prime is ~ N*logN