## Chapter 1 : Fundamental of R

# 1.2 Object

die <- c(1:6)

die * die   # element-wise execution
die %*% die # vector inner product
die %o% die # vector outer product

# 1.3 Function

mean(die) # average of die vector
round(mean(die)) # round up of average of die vector
sample(x = 1:4, size = 2) # sampling size = 2 of numbers from x vector

sample(die, size = 1)

# 1.4 Sampling with replacement

sample(die, size = 2) # sampling of one pair of number from die vector

# but in this case, we never get a pair of number consisted with exactly same number
# basically sample function return samples without replacement
# therefore, we need to specific argument for sampling with replacement (replace = TRUE)

dice <- sample(die, size = 2, replace = TRUE)
dice
# once sample function is assigned to variable 'dice', specific pair of numbers 
# are determined as a object, and can't change.
# but suppose we want to change the extracted number of 'dice' whenever we are calling 'dice'.
# what can we do?

# 1.5 Write our own function
# 1.5.1 function generator

roll <- function() {
        die <- c(1 : 6)
        dice <- sample(die, size=2, replace=TRUE)
        sum(dice)
}

# 1.6 Argument

roll2 <- function(bones) {
        dice <- sample(bones, size=2, replace=TRUE)
        sum(dice)
} # we are going to insert argument 'bones' that can provide specific vector, for instance, c(1:4) or c(1:6), etc.

roll2(bones = 1:20) # but, it must be needed argument 'bones' to perform this function

# now, let's try provide the default value for arg 'bones'
roll2 <-  function(bones = 1:6) {
        dice <-  sample(bones, size = 2, replace = TRUE)
        sum(dice)
}

roll2()
roll2() # now we use default value of argument, vector c(1:6).
