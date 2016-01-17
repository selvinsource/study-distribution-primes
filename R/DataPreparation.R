#prepare training file for classification (primality) 
if(TRUE){
  library(numbers)
  sink("primes.txt")
  t <- 10000
  for (x in 2:t) {
    cat(sprintf("%i,%i\n", x, if(isPrime(x)) 1 else 0))
  }
  sink()
}

#prepare training file for regression (distribution)
if(FALSE){
  library(numbers)
  sink("primesDistribution.txt")
  t <- 10000
  for (x in 2:t) {
    cat(sprintf("%i,%i\n", x, length(Primes(x))))
  }
  sink()
}