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

dim(die)
class(die)

now <- Sys.time()
now
typeof(now)
class(now)
# Time object is made by second duration from 1970-01-01. We can see it with unclass function
unclass(now)

# factor is the method that save categorical information such like gender, color of eye, ethnic group etc.
gender <- factor(c('male', 'female', 'female', 'male'))
typeof(gender)
attributes(gender)
# Use unclass function if you want to see how 'factor' saves above 'gender' objects
unclass(gender) # 1 labels 'female' and 2 labels 'male' in R factor'
gender
# If you want see 'gender' as a character, use as.character function
as.character(gender)

card <- c('ace', 'hearts', 1)
card 
# Because data type such as vector, matrix, and array doesn't have different type data,
# integer 1 in 'card' object must change its data type as 'character'

# 3.6 Type conversion
# If vector has 'character' type, every other data type will be converted to 'character'
# If your vector only has 'logical' and 'numerical', 'logical' data will be converted to type 'numeric',
# such like 'True' -> 1, 'False' -> 0.

sum(c(TRUE, TRUE, FALSE, FALSE)) # sum function count 'TRUE' of logical vector

# And we also convert data type as we want to be.
as.character(1)
as.logical(1)
as.numeric(FALSE)

# 3.7 List
# List save different type of data!

list1 <- list(100:130, "R", list(TRUE, FALSE))
list1
card1 <- list('ace', 'hearts', 1)
card1

# 3.8 Dataframe
# Data frame is two dimensional version of list
# Data frame can save different data type at each column
# But there should be identical data type of each column.

df <- data.frame(face = c('ace', 'two', 'six'),
                 suit = c('clubs', 'clubs', 'clubs'),
                 value = c(1, 2, 3))
df
typeof(df)
class(df)
str(df)
?data.frame
# See arguments of data.frame! 'stringsAsFactors' is FALSE as default
# if we set out 'stringsAsFactors' as TRUE, all 'charactor' data type in data.frame is represented as 'factor'!

df2 <- data.frame(face = c('ace', 'two', 'six'),
                 suit = c('clubs', 'clubs', 'clubs'),
                 value = c(1, 2, 3),
                 stringsAsFactors = TRUE)
df2
str(df2)

# 3.9 Load Data
# deck data frame can be loaded from 'http://bit.ly/deck_CSV'
# and click 'Import Dataset' in Environment tab right above window.

head(deck)
head(deck, 10)

# 3.10 Save Data
# Let's save 'deck' dataset copy using write.csv command

write.csv(deck, file = 'cards.csv', row.names = FALSE) # row.names=TRUE add index column
                    
                 

## Chapter 4 : R notation

# 4.1 Value Choice
deck
deck[,]                 
# There are six method for indexing
# 4.1.1 positive number
deck[1, 1]
deck[1, 1:3]
deck[1, c(1, 2, 3)]
deck[c(1, 1), c(1, 2, 3)]
deck[1 : 2, 1 : 2]
deck[1:2, 1]  # return result as a vector
deck[1:2, 1, drop = FALSE]  # return result as a data frame

# 4.1.2 negative number
deck[-1, 1:3] # return every rows except row 1
deck[-(2:52), 1:3] # return row 1 only

# 4.1.4 empty
deck[1, ] # empty index means that 'bring me everything'

# 4.1.5 logical variables
deck[1, c(TRUE, TRUE, FALSE)]
# This kind representation looks quite weird but you should know how this method is powerful.

# 4.1.6 name
# if object has 'name' attribute, we can use that with indexing
deck[1, c('face', 'suit', 'value')]
deck[ ,'value']

# 4.2 Deal cards
deal <- function(cards) {
        cards[1, ]
}
deal(deck)

# 4.3 Shuffle cards
deck2 <- deck[ , ]
deck2
deck3 <- deck[c(3, 2, 1, 4:52), ]
deck3

random <- sample(1:52, size = 52)
random
deck4 <- deck[random, ]
deck4
shuffle <- function(cards) {
        random <- sample(1:52, size = 52)
        cards[random, ]
}
shuffle(deck)

# now we can shuffle cards whenever we need
deal(deck)
deck2 <- shuffle(deck)
deal(deck2)

# 4.4 '$' and '[[]]'
# Data frame and list can call values using 'S' and '[[]]' notation
deck$value
# '$' notation returns values of 'value' columns as vector
mean(deck$value)
median(deck$value)

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c('a', 'b', 'c'))
lst
lst[1] # this notation returns list, not a vector! To return vector, we should use double quote!!
sum(lst[1]) # not working! because lst[1] also list!
sum(lst[[1]]) # now it's working!
sum(lst$numbers) # if it has name attribute, use '$' notation.
sum(lst[['numbers']]) # this is exactly same with above equation.

