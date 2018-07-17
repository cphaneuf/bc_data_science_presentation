# The code below demonstrates key lessons from DataCamp's Intermediate R.
# Keywords: relational operators, logical operators, conditionals, loops, functions, packages, apply family, utilities

# ---MISC.---

# help(function_name) - gives function info
# ?function_name - gives function info
# args(function_name) - gives function argument info

# ---RELATIONAL OPERATORS---

# Equality ==
# Inequality !=
# Greater than >, >=
# Less than <, <=

# Use conditionals to compare vector contents
nums <- c(16, 8, 24, 12)
nums > 20

# Use conditionals to compare vectors
nums2 <- c(13, 21, 55, 67)
nums >= nums2

# Use conditionals to compare matrix elements
nums_matrix <- matrix(c(nums, nums2), nrow = 2, byrow = TRUE)
nums_matrix == 12

# ---LOGICAL OPERATORS---

# And (evaluates vectors element-wise) - &
# Only examines the first element of each vector - &&
# Or (evaluates vectors element-wise) - |
# Only examines the first element of each vector - ||

# Permutations of logical operators
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE
TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

# Use conditionals and logical operators to compare vectors
nums > 10 | nums2 <= 20

# Combining negations with logical operators
x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))
# (equivalent to...)
!(x >= 4 & !!(y <= 12))
# (equivalent to...)
!(x >= 4 & !(y > 12))
# (equivalent to...)
!(x >= 4 & y <= 12)
# (equivalent to...)
x < 4 | y > 12

# Count the number of trues in logical_vec
nums_matrix
choice_col <- nums_matrix[,2]
logical_vec <- choice_col > 18 | choice_col < 52
sum(logical_vec)

# ---CONDITIONALS---

# General form:
# if (condition) {
#    expr1
# } else if (condition) {
#    expr2
# } else {
#    expr3
# }

# Some examples
# Simple
temp <- 90
if (temp > 70) {
  print("hot outside")
} else if (temp > 50) {
  print("medium outside")
} else {
  print("cold outside")
}
# Nested statements
temp <- 40
if (temp >= 60) {
  if (temp >= 70) {
    attire <- "definitely don't need coat"
  } else {
    attire <- "check other weather influences"
  }
} else if (temp >= 40) {
  attire <- "will need coat; type will vary"
} else {
  attire <- "will need warm coat"
}
print(attire)

# ---LOOPS---

# General form:
# while(condition) {
#    expr
# }

# Some examples
# Simple
ctr <- 2
while (ctr <= 8) {
  print(paste("ctr is set to", ctr))
  print(paste("the double of ctr is", 2 * ctr))
  ctr <- ctr + 1
}
# Combined with conditionals and break statement
while (temp < 60) {
  print(paste("It's", temp, "degrees out"))
  if (temp < 50) {
    print("Wear a coat!")
    temp <- temp + 2
  }
  else {
    if (temp >= 58) {
      break
    }
    temp <- temp + 1
  }
}

# General form:
# for (var in seq) {
#   expr
# }

# NOTE: in R, for loops maintain their own counter. Therefore, you can write...
nums <- c(2, 4, 6, 5, 3)
for (num in nums) {
  print(num)
}
# ...instead of (which is more versatile, but more difficult to write):
for (i in 1:length(nums)) {
  print(nums[i])
}

# Loop through a list
friends <- list(total = 6, names = c("Ross", "Rachel", "Chandler", "Monica", "Joey", "Phoebe"), best_show_ever = TRUE)
for (friend in friends) {
  print(friend)
}

# Loop through a matrix
row1 <- c("x", "o", "x")
row2 <- c("x", "x", "o")
row3 <- c("o", "o", "x")
tic_tac_toe <- matrix(c(row1, row2, row3), byrow = TRUE, nrow = 3)
for (i in 1:nrow(tic_tac_toe)) {
  for (j in 1:ncol(tic_tac_toe)) {
    print(paste("Row", i, "and column", j, "is", tic_tac_toe[i,j]))
  }
}
  
# Some examples
# Use next statement
names = c("Ross", "Rachel", "Chandler", "Monica", "Joey", "Phoebe")
for (name in names) {
  if (nchar(name) > 6) {
    print(name)
    print("More than 6 letters")
  }
  else if (nchar(name) > 5) {
    print(name)
    print("More than 5 letters")
  }
  else if (nchar(name) > 4) {
    print(name)
    print("More than 4 letters")
  }
  else {
    next
  }
}
# Use strsplit()
quote <- "JOEY DOESN'T SHARE FOOD!"
chars <- strsplit(quote, split = "")[[1]]
chars
count <- 0
for (char in chars)  {
  if (char == "!") {
    break
  }
  print(char)
  count <- count + 1
}
print(count)

# ---FUNCTIONS---

# NOTE: R matches function arguments by position AND by name
# NOTE: if you want to save the output of a function, assign the result to a variable
# NOTE: variables declared within a function exist only in the SCOPE of that function
# NOTE: R passes arguments by VALUE
# NOTE: if an argument is not passed and it is an optional parameter, the default value will be used

# Using built-in functions
rand_nums <- c(9, 43, 5789, 29384, NA, 394875, NA)
mean(rand_nums, na.rm = TRUE)

# Writing own functions - general form:
# my_func <- function (arg1, arg2) {
#    body
# }

# Some examples
# No arguments
greeting <- function() {
  print("hi")
}
greeting()
# One argument
square <- function (arg1) {
  arg1^2
}
square(8)
# Two arguments
pow <- function (base, power) {
  y <- base^power
  return(y)
}
pow(2, 4)

# ---PACKAGES---

# Install - install.packages("package_name")
# Load - library("package_name")
# Search for a loaded package - search()

# Use package ggplot2
# NOTE: Upon attempting to install ggplot2, I received this error message:
#       'Error: package or namespace load failed for ‘ggplot2’: object ‘enexprs’ is not exported by 'namespace:rlang' In addition: Warning message: package ‘ggplot2’ was built under R version 3.4.4'
#       This means that package rlang needs to be installed first
search()
install.packages("rlang")
library("rlang")
install.packages("ggplot2")
library("ggplot2")
search()
qplot(nums_matrix[1,], nums_matrix[2,])

# ---APPLY---

# lapply(data_structure, function) - apply the function over the entire data structure (list or vector); always returns a list; replaces a loop
ordered_letters <- c("A:1", "B:2", "C:3")
split <- strsplit(ordered_letters, split = ":")
split_low <- lapply(split, tolower)
letters <- lapply(split_low, function(x) {x[1]})
order <- lapply(split_low, function(x) {x[2]})
letters
order

# sapply(data_structure, function) - runs lapply(), then simplify() to convert the list generated to an array
ordered_letters2 <- c("A:1", "B:2", "C:3")
split2 <- strsplit(ordered_letters2, split = ":")
split_low2 <- lapply(split2, tolower)
letters2 <- sapply(split_low2, function(x) {x[1]})
order2 <- sapply(split_low2, function(x) {x[2]})
letters2
order2

# vapply(data_structure, function, vector_type(vector_length)) - must define vector type and length being returned
ordered_letters3 <- c("A:1", "B:2", "C:3")
split3 <- strsplit(ordered_letters3, split = ":")
split_low3 <- lapply(split3, tolower)
split_low3
letters3 <- vapply(split_low3, function(x) {x[1]}, character(1))
order3 <- vapply(split_low3, function(x) {x[2]}, character(1))
letters3
order3

# ---USEFUL FUNCTIONS---

# Mathematical utilities
# abs()
# sum()
# mean()
# round()

# Data utilities
# rev()
# seq()
# rep()
# sort()
# str()
# append()
# is.object_name() - check the class of an R object
# as.object_name() - convert an R object from one class to another
# unlist()
# class() - check the data type of the object

# ---REGULAR EXPRESSIONS---

# grepl(pattern = <reg_exp>, x = <string_or_vec>)
# gives a vector of logicals
# "^a" - looks for words starting with a
# "a$" - looks for words ending with a
fruits <- c("apple", "banana", "berry", "peach")
grepl(pattern = "^a", x = fruits)

# grep(pattern = <reg_exp>, x = <string_or_vec>)
# gives a vector of indices
grep(pattern = "a$", x = fruits)

# sub(pattern = <reg_exp>, replacement = <str>, x = <string_or_vec>)
# only replaces the first match in each string
sub(pattern = "a|e|i|o|u", replacement = "[WAS A VOWEL]", x = fruits)

# gsub(pattern = <reg_exp>, replacement = <str>, x = <string_or_vec>)
# replaces all matches in each string
gsub(pattern = "a|e|i|o|u", replacement = "[WAS A VOWEL]", x = fruits)

# ---TIMES AND DATES---

# Makes an object of type Date
today <- Sys.Date()
today

# Makes an object of type POSIXct
now <- Sys.time()
now

# Creating and formatting dates
# %Y - 4-digit year
# %y - 2-digit year
# %m - 2-digit month
# %d - 2-digit day
# %A - weekday
# %a - abbreviated weekday
# %B - month
# %b - abbreviated month
str1 <- "May 12, '97"
str2 <- "1998-05-12"
str3 <- "12/May/1999"
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

# Creating and formatting times
# %H - hours as a decimal number
# %I - hours as a decimal number
# %M - minutes as a decimal number
# %S - seconds as a decimal number
# %T - shortand for %H:%M:%S
# %p - AM/PM indicator
stra <- "May 12, '97 hours:01 minutes:01 seconds:01"
strb <- "1998-5-12 01:02:01"
timea <- as.POSIXct(stra, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
timeb <- as.POSIXct(strb)
format(timea, "%M")
format(timeb, "%I:%M %p")

# Can do arithmetic with dates and time! (some examples included below)
# Date manipulation
as.Date(date2) - as.Date(date1)
some_days <- c(date1, date2, date3)
day_diff <- diff(some_days)
mean(day_diff)
# Time manipulation
time_diff <- as.POSIXct(timeb) - as.POSIXct(timea)
sum(time_diff)
mean(time_diff)
# Combination manipulation
date_example <- as.Date(some_days, "%d-%b-%Y")
datea <- as.Date(stra, format = "%b %d, '%y")
dateb <- as.Date(strb)
strc <- "May 12, '99 hours:01 minutes:03 seconds:01"
datec <- as.Date(strc, format = "%b %d, '%y")
some_days2 <- c(datea, dateb, datec)
date_example2 <- as.Date(some_days2, "%d-%b-%Y")
max(abs(some_days - some_days2))