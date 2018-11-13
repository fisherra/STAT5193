# thinking problem ch 4 
friend_a <- sample(0:60, size = 100000, replace = T)
friend_b <- sample(0:60, size = 100000, replace = T)
diff_vect <- friend_a - friend_b
friends_meet <- abs(diff_vect) <= 10

sum(friends_meet) / length(friends_meet)