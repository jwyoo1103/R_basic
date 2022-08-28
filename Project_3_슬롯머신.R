## Chapter 7 Program
# Slot machine: 1. randomized three symbol
#               2. calculate score

# generation of symbol -> pick up three among diamond(DD), seven(7), triple bar(BBB), 
#                         double bar(BB), single bar(B), cherry(C), zero(0)

get_symbols <- function(){
        wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
        sample(wheel, size = 3, replace = TRUE,
               prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
get_symbols()
get_symbols()

# 7.1 Strategy
# 1. Complicated bit one task divide to small and simple subtasks.
# 2. Use concrete examples
# 3. Consider possible method as natural language, then convert it R laguage.

# 7.2 if phrase
x <- 1
if (3 == 3){
        x <- 2
}
x

x <- 1
if (TRUE){
        x <- 2
}
x

x <- 1
if (x == 1){
        x <- 2
        if (x == 1){
                x <- 3
        }
}
x

# 7.2 else phrase
a <- 3.14
dec <- a - trunc(a)
dec

if (dec >= 0.5){
        a <- trunc(a) + 1
} else {
        a <- trunc(a)
}
a

a <- 1
b <- 1

if (a > b){
        print("A wins!")
} else if (a < b){
        print("B wins!")
} else {
        print("Tie.")
}

# main code for scoring program
symbols <- c('DD', 'DD', 'DD')
all(symbols == symbols[1])
length(unique(symbols)) == 1

same <- length(unique(symbols)) == 1

symbols <- c('B', 'BB', 'BBB')
all(symbols %in% c('B', 'BB', 'BBB'))

bars <- symbols %in% c('B', 'BB', 'BBB')
all(bars)

# 7.4 Lookup Table 
payouts <- c('DD' = 100, '7' = 80, 'BBB' = 40, 'BB' = 25,
             'B' = 10, 'C' = 10, '0' = 0)
payouts['BBB']
unname(payouts['BBB'])


# Final Scoring board
same <- length(unique(symbols)) == 1
bars <- symbols %in% c('B', 'BB', 'BBB')

if (same) {
        payouts <- c('DD' = 100, '7' = 80, 'BBB' = 40, 'BB' = 25,
                     'B' = 10, 'C' = 10, '0' = 0)
        prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
        prize <- 5
} else {
        cherries <- sum(symbols == 'C')
        prize <- c(0, 2, 5)[cherries + 1]
        # payouts <- c('2' = 5, '1' = 2, '0' = 0)
        # prize <- unname(payouts[as.character(cherries)])
}

diamonds <- sum(symbols == 'DD')
prize * 2^diamonds













