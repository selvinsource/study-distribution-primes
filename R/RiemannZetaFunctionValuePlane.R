#The Riemann Zeta Function domain extended to complex number
#p220 -> The value plane, showing points that come from the critical line
#options(digits = 20)

eta <- function(s,terms) {
  sum <- 1
  for (x in 2:terms) {
    if(x %% 2 == 0L) term <- -1/x^s else term <- 1/x^s
    sum <- sum + term
  }
  sum
}

zetaUsingEta <- function(s,terms) {
  zetaValue <- eta(s,terms) / (1 - 1/2^(s-1))
  if(Re(zetaValue) > -0.02 & Re(zetaValue) < 0.02 & Im(zetaValue) > -0.02 & Im(zetaValue) < 0.02)
    cat("\nPossible Zero:", s)
  zetaValue
}

criticalLinePoints <- function(height) {
  points <- complex(real = 1/2, imaginary = 0)
  for (x in seq(0.1,height,by=0.05)) {
    points <- c(points, complex(real = 1/2, imaginary = x))
  }
  points
}

argCriticalLine <- criticalLinePoints(35)
valueCriticalLine <- sapply(argCriticalLine,zetaUsingEta,terms=10000)
plot(Re(valueCriticalLine),Im(valueCriticalLine),type="l",ann=FALSE)
abline(h=0,v=0,col="green")
title("The zeta function value plane for argument on the critical line")