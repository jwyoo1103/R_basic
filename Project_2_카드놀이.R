## Chapter 3 : R Object

# 3.1 Atomic Vector
die <- c(1, 2, 3, 4, 5, 6)
die
is.vector(die)

# Is just one element vector also atomic vector?
five <- 5
is.vector(five)

# There are six basic atomic vectors, involving 'double', 'integer', 'character'
# 'logical', 'complex', and 'raw'

int <- c(1L, 5L) # Large L behind number make number 'integer'
text <- c('ace', 'hearts')
int
logic <- c(TRUE, FALSE, TRUE)
comp <- c(1 + 1i, 1 + 2i, 1 + 3i)
raw(3)

typeof(die)
typeof(int) # R doesn't save number as integer if not contain 'L'
typeof(text)
typeof(logic)
typeof(comp)
typeof(raw(3))

# 3.2 Attributes

attributes(die)
# general attributes contains 'names', 'dimension', 'class'
# die doesn't have any attributes. Let's give it a name.
names(die) <- c('one', 'two', 'three', 'four', 'five', 'six')
# Now die has names attributes!
names(die)
attributes(die)
die # R print out 'names' whenever you want to see 'die' object.
# If you remove names attributes, use names(die) <- NULL
names(die) <- NULL
die

# Let's give 'die' a dimension attributes
dim(die) <- c(2, 3)
die
dim(die) <- c(3, 2)
die
dim(die) <- c(1, 2, 3) # hypercube
die # We will use matrix() or array() function rather than dim() later.

# 3.3 Matrix

m <- matrix(die, nrow = 2)
m
m <- matrix(die, nrow = 2, byrow = TRUE)
m

# 3.4 Array

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar
hand1 <- c('ace', 'king', 'queen', 'jack', 'ten', 'spades','spades', 'spades', 'spades', 'spades')
royal <- matrix(hand1, nrow = 5)
royal

# 3.5 Class


