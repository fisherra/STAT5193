# grad project
# Fisher Ankney
# Stat 5193
# November 15 2018

# simulates the probability that two friends meet in an interval of time

# name function and arguments
friends_meet <- function(interval = 60, wait_time = 10) {
  
  interval <- interval + 2
  # one million random arrival times within time interval (a)
  friend_a <- sample(0:interval, size = 1000000, replace = T)
  
  # one million random arrival times within time interval (b)
  friend_b <- sample(0:interval, size = 1000000, replace = T)
  
  # find the difference for each element 
  diff_vect <- friend_a - friend_b
  
  # if the difference is within the wait_time arguement, they meet (true)
  they_meet <- abs(diff_vect) <= wait_time

  # the probability of them meeting is the number of times they meet, over the total
  prob <- sum(they_meet) / length(they_meet)
  
  # plot the differences in arrival time 
  plt <- hist(diff_vect, probability = T)
  # fit a normal curve to this
  plt <- curve(dnorm(x, mean(diff_vect), sd(diff_vect)), add = T)
  # plot the lower bounds of the friends meeting
  plt <- lines(abline(v = wait_time, lwd = 3, col = 'firebrick'))
  # plot the upper bounds of the friends meeting
  plt <- lines(abline(v = -wait_time, lwd = 3, col = 'firebrick'))

  # return both the probability and the graphic
  return(list(plt, prob))

}