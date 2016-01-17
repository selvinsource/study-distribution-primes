#Count the number of primes up to a real number
#π(x)
#p298
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
x <- seq(2,20,by=0.1)
y <- sapply(x,π)
plot(x,y,type="p")
title("Prime Counting Function Real")