#Count the number of primes up to a quantity
#π(N)
#p38
#http://cran.r-project.org/web/packages/numbers/numbers.pdf
#isPrime nextPrime previousPrime primeFactors Primes twinPrimes/coprime
#install.packages("numbers")
library(numbers)
f <- function(x){
  y <- Primes(x) 
  return (length(y))
}
#x <- c(1000,1000000,1000000000)
x <- c(10,100,1000,10000,100000,1000000)
y <- sapply(x,f)
plot(x,y,type="l")
title("Prime Counting Function")