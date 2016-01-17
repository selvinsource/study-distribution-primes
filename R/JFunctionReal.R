#The J function J(x) = sum(1/t*π(x^1/t))
#J(x)
#p299
#p300
#http://cran.r-project.org/web/packages/numbers/numbers.pdf
#isPrime nextPrime previousPrime primeFactors Primes twinPrimes/coprime
#install.packages("numbers")
library(numbers)
π <- function(x){
  if(!x%%1==0){
    return (length(Primes(floor(x))))
  }
  else{
    if(length(Primes(floor(x))) == length(Primes(floor(x-1))))
      return (length(Primes(floor(x))))       
    else
      return (length(Primes(floor(x))) - 1/2)
  }
}

J <- function(x) {
  t <- 1
  y <- 0
  while(x^(1/t) >= 2){
    y <- y + 1/t*π(x^(1/t))
    t <- t+1
  }
  return (y)
}

x <- seq(1,10,by=0.1)
y <- sapply(x,J)
plot(x,y,type="p")
title("J(x) = sum(1/t*π(x^(1/t)))")