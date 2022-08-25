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
#sum(lst[1]) # not working! because lst[1] also list!
sum(lst[[1]]) # now it's working!
sum(lst$numbers) # if it has name attribute, use '$' notation.
sum(lst[['numbers']]) # this is exactly same with above equation.



## Chapter 5 Data Manipulation

# data copy
deck2 <- deck

# 5.1 value update
vec <- c(0, 0, 0, 0, 0, 0)
vec[1] <- 1000
vec
vec[c(1, 3, 5)] <- c(1, 1, 1)
vec
vec[4:6] <- vec[4:6] + 1
vec
vec[7] <- 0
vec

deck2$new <- 1:52  # new variable 'new' added to deck2 data frame
head(deck2)
deck2$new <- NULL  # remove variable 'new'
head(deck2)

## War game -> the score of ace is 14 not 1
deck2[c(13, 26, 39, 52), ] # find ace card
deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)  # can use just '14' because of recycling rule
deck2[c(13, 26, 39, 52), ]

# 5.2 Logical subsetting
# If cards are shuffled? How can we find ace out?
deck3 <- shuffle(deck)
deck3

deck2$face
deck2$face == 'ace'
sum(deck2$face == 'ace') # Logical operator regards '1' for TRUE and '0' for FALSE

deck3[deck3$face == 'ace', ]
deck3$value[deck3$face == 'ace'] <- 14
deck3

## Heart game -> Values of every cards are '0', apart from 'Heart' cards and 'Spade Queen'
deck4 <- deck
deck4$value <- 0
deck4
deck4$value[deck4$suit == 'hearts'] <- 1
deck4
# Now we should find out spade queen! how can we do?
deck4[deck4$face == 'queen', ]
deck4[deck4$suit == 'spades', ]
deck4[deck4$face == 'queen' & deck4$suit == 'spades', ]
deck4$value[deck4$face == 'queen' & deck4$suit == 'spades'] <-  13
deck4

# examples
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- 'February'
z <- c('Monday', 'Tuesday', 'Friday')
# is w positive number?
w > 0
# is x greater than 10 and less than 20?
x > 10 & x < 20
# object of variable y tells us 'February'?
y == 'February'
# does every value of z tell us day?
all(z %in% c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))

## Black Jack -> face = score, but kin, queen jack = 10, ace get score 1 or 10 as the result of game
deck5 <- deck
deck5[deck5$face %in% c('king', 'queen', 'jack'), ]
facecards <- deck5$face %in% c('king', 'queen', 'jack')
deck5[facecards, ]
deck5$value[facecards] <- 10
deck5

# Can we set the score of ace properly? how? the score of 'ace' is changed by specific condition!.
# If the total score of my cards is less than 21, the score of ace is 11, otherwise 1.
# This means the information is missing!

# 5.3 Missing information
# 'NA' means missing
1 + NA
c(NA, 1:50)
mean(c(NA, 1:50)) # if we have just one 'NA' value, all numeric operation should be 'NA'
# so R provide special argument that get rid of 'NA' value, na.rm
mean(c(NA, 1:50), na.rm = TRUE)

# In order to find 'NA' value, we can use function is.na
vec <- c(1, 2, 3, NA)
is.na(vec)

# Let's give the score of 'ace' NA
deck5$value[deck5$face == 'ace'] <- NA
deck5
# Then we're going to give ace the score by conditional state!



## Chapter 6 R Environment

# 6.2 Environment manupulation

as.environment('package:stats')
globalenv()
baseenv()
emptyenv()

parent.env(globalenv())
parent.env(emptyenv()) # empty environment is the only environment that does not have parent env.

ls(emptyenv())
ls(globalenv())

head(globalenv()$deck, 3)
assign('new', 'Hello Global', envir=globalenv())
globalenv()$new

environment()
# R find your command in global environment first, but there is no object?

# 6.3 Scoping rule
# 1. R finds your objects in active environment first.
# 2. In case of command line work, active env is global env, 
#    therefore, R start to find your objects that are invoked in command line, in global environment.
# 3. If R can't get objects that you want to find, R search its parent environment until it find objects
#    or reach empty environment.

deal <- function(){
        deck[1, ]
}
environment(deal)
deal()
# let's remove first cards after deal from deck
DECK <- deck
deck <- deck[-1, ]
head(deck)

deal <- function(){
        card <- deck[1, ]
        deck <- deck[-1, ]
        card
}
deal()
deal()
deck
# when using deal function, every dealed card should be removed. 
# But deck object inside function uses 'deck' existed in global env.
# deck object of global env is not changed by function. so deal function is not working that we want to
# How we can assign deck[-1, ] inside deal function to deck object of global env?

deal <- function(){
        card <- deck[1, ]
        assign('deck', deck[-1, ], envir=globalenv())
        card
}
deal()
deal()
deal()
# Now, every first card in deck object is effectively removed!!

head(deck, 3)
# let's see the shuffle function
shuffle # shuffle function doesn't mix card object. Just return mixed deck object's copy.
a <- shuffle(deck)
head(a, 3)
head(deck, 3) # after use shuffle function, order of original deck object is not changed

# Now, we write function shuffle again that 'deck' object in global env is replaced by
# mixed 'DECK' object.
shuffle <- function(){
        random <- sample(1:52, size = 52)
        deck <- assign('deck', DECK[random, ], envir = globalenv())
}

deal()
shuffle()
deal()
# 'deck' is in global environment. that makes some problem if we change deck.
# to get rid of this issue, deck will be saved in runtime environment.

setup <- function(deck){
        DECK <- deck
        
        DEAL <- function(){
                card <- deck[1, ]
                assign('deck', deck[-1, ], envir = globalenv())
                card
        }
        
        SHUFFLE <- function(){
                random <- sample(1:52, size = 52)
                assign('deck', DECK[random, ], envir = globalenv)
        }
        list(deal = DEAL, shuffle = SHUFFLE)
} # now we saved arguments in runtime environment.

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
# now we can use above functions but their location is no more global env!
deal
environment(shuffle)

# Let's make functions refers to their parent environment, not global enviroment
setup <- function(deck){
        DECK <- deck
        
        DEAL <- function(){
                card <- deck[1, ]
                assign('deck', deck[-1, ], envir = parent.env(environment()))
                card
        }
        
        SHUFFLE <- function(){
                random <- sample(1:52, size = 52)
                assign('deck', DECK[random, ], envir = parent.env(environment()))
        }
        
        list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

# Now, we use card game even if deck accidentally removed in global environment.

rm(deck)

shuffle()
deal()
deal()
















