# define g1
g1 <- formula

# define g1_hat formula
g1_hat <- function(g1) {
  # code to define
}

# first g1_hat
g1_hat <- g1_hat(g1)

# define e
e <- abs(g1 - g1_hat)

# define counter 
i <- 0 

new.g1 <- g1_hat(g1)

while (e < num) {
  # iterate g1
  g1 <- g1_hat(g1)
  # iterate e
  e <- abs(g1 - g1_hat)
  # add one to counter
  i <- i + 1
  # print final count
  print(i)
  print(g1)
}