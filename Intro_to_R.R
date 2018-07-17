# The code below demonstrates key lessons from DataCamp's Introduction to R.
# Keywords: variables, vectors, matrices, factors, data frames, lists

# ---MISC.---

# Control-L clears console

# ---VARIABLES---

# Declare and initialize a (numeric) variable
my_num <- 1

# Declare and initialize a (string) variable
my_string <- "okay"

# Declare and initialize a (logical) variable
my_bool <- FALSE

# Print out the value of a variables
my_num
my_string
my_bool

# Check class of variable
class(x)

# Check which variables exist
ls()

# ---VECTORS---

# Make vectors
num_vec <- c(2, 4, 6)
char_vec <- c("a", "b", "c")
bool_vec <- c(TRUE, FALSE, TRUE)

# Assign names to vector values
names(num_vec) <- c("even1", "even2", "even3")

# Print out the contents of a vector
num_vec

# Assign names to vector values through an alternate method, then print
num_vec_names <- c("evena", "evenb", "evenc")
names(num_vec) <- num_vec_names
num_vec

# Sum 2 vectors together and print the total's contents
A_vec <- c(1, 2, 3)
B_vec <- c(4, 5, 6)
total_vec <- A_vec + B_vec
total_vec

# Sum the values in a vector
total_val <- sum(total_vec)
total_val

# Compare values
total_val2 <- 99
total_val > total_val2

# Define a new variable based on a selection from a vector
# NOTE: R vectors are NOT 0-indexed!
a_val <- num_vec[1]
b_val <- num_vec[2]
c_val <- num_vec[3]
a_val
b_val
c_val
end_vals <- num_vec[c(1,3)]
end_vals
start_vals <- num_vec[c(1:2)]
start_vals

# Calculate the mean of values in a vector
mean(num_vec)

# Select values from a vector based on a condition
select_vec <- num_vec > 3
select_vec

# Extract values from original vector based on selection vector
extract_vec <- num_vec[select_vec]
extract_vec

# ---MATRICES---

# Construct a matrix with 3 rows that contain the numbers 1-9
matrix(1:9, byrow = TRUE, nrow = 3)

# Make multiple vectors, combine them into a single vector, then construct a matrix
vec1 <- c(1, 2)
vec2 <- c(3.4, 5.6)
vec3 <- c(-7, -8)
big_vec <- c(vec1, vec2, vec3)
big_matrix <- matrix(big_vec, byrow = TRUE, nrow = 3)
big_matrix

# Name the rows and columns
col_names <- c("A", "B")
row_names <- c("1", "2", "3")
colnames(big_matrix) <- col_names
rownames(big_matrix) <- row_names
big_matrix

# Sum rows (function rowSums() creates a new vector)
sum_rows <- rowSums(big_matrix)
sum_rows

# Sum columns (function colSums() creates a new vector)
sum_cols <- colSums(big_matrix)
sum_cols

# Use cbind() function to merge matrices/vectors together by COLUMN
# NOTE: you can add to an existing matrix...
big_matrix <- cbind(big_matrix, sum_rows)
big_matrix
# NOTE (cont.): ...or make a new one
even_bigger_matrix <- cbind(big_matrix, sum_rows)
even_bigger_matrix

# Use rbind() function to merge matrices, in order
matrix1 <- matrix(1:9, byrow = TRUE, nrow = 3)
matrix2 <- matrix(10:18, byrow = TRUE, nrow = 3)
together_matrix <- rbind(matrix1, matrix2)
together_matrix

# Compare rbind() (immediately above) and cbind() (immediately below)
together_matrix2 <- cbind(matrix1, matrix2)
together_matrix2

# Select elements from a matrix
# (Individual element)
together_matrix[1,1]
# (Multiple elements)
together_matrix[2:4, 1:3]
# (Entire column)
together_matrix[,2]
# (Entire row)
together_matrix[2,]

# Operate on a matrix
together_matrix2
double_together_matrix2 <- together_matrix2 * 2
double_together_matrix2
double_together_matrix2 <- double_together_matrix2 / 4
double_together_matrix2
mean(double_together_matrix2)

# Operate on a matrix using another matrix
matrix1
matrix2
operated_matrix <- matrix1 / matrix2
operated_matrix

# ---FACTORS---
# NOTE: data type used to store categorical variables

# Make a factor (nominal categorical variable)
sex_vector <- c("M", "F", "F", "M")
factor_sex_vector <- factor(sex_vector)
factor_sex_vector

# Make a factor (ordinal categorical variable)
order_vector <- c("low", "med", "high", "med", "low")
factor_order_vector <- factor(order_vector, order = TRUE, levels = c("low", "med", "high"))
factor_order_vector

# Specify levels
levels(factor_sex_vector) <- c("F", "M")
factor_sex_vector

# Generate summaries for the vector and the factor
summary(sex_vector)
summary(factor_sex_vector)

# Create variables from elements of a factor
male <- factor_sex_vector[1]
female <- factor_sex_vector[2]

# Compare elements of a factor (only possible with meaningfully ordered variables [order = TRUE])
lev1 = factor_order_vector[1]
lev3 = factor_order_vector[3]
lev1 > lev3

# ---DATAFRAMES---

# Dataframe functions
# head() - show the first observations of a dataframe with a variable name header
# tail() - show the last observations of a dataframe with a variable name header
# str() - shows the structure (total num of observations, total num of variables, full list of variable names, data type of each variable, first observations)
# order() - gives the ranked position of each element when it is applied on a variable

# Create a dataframe
name <- c("Ross", "Rachel", "Chandler", "Monica", "Joey", "Phoebe")
trait <- c("married", "pretty", "funny", "clean", "hungry", "free-spirited")
occupation <- c("dinosaurs", "waitress", "advertising", "chef", "actor", "singer")
num_children <- c(2, 1, 2, 2, 0, 3)
has_lived_with_monica <- c(TRUE, TRUE, TRUE, TRUE, FALSE, TRUE)
friends_df <- data.frame(name, trait, occupation, num_children)
head(friends_df)
tail(friends_df)
str(friends_df)
order(name)

# Print out parts of dataframe
friends_df
friends_df[1, 3]
friends_df[3,]
friends_df[,2]

# Select parts of a column
friends_df[1:3, "num_children"]
stored_col <- friends_df$num_children
stored_col

# Select all columns for some condition
friends_df[has_lived_with_monica,]
subset(friends_df, subset = num_children < 2)

# Using order()
order_num_children <- order(friends_df$num_children)
friends_df[order_num_children,]

# ---LISTS---

# Construct and name a list
my_vector <- 1:10
my_matrix <- matrix(1:9, ncol = 3)
my_df <- friends_df[1:3,]
my_list <- list(my_vector, my_matrix, my_df)
# Naming method 1
names(my_list) <- c("vec", "matrix", "partial_df")
my_list
# Naming method 2
my_list2 <- list(vec = my_vector, matrix = my_matrix, partial_df = my_df)
my_list2

# Print out the vector portion and individual element of previously constructed list
my_list[["vec"]]
my_list[["vec"]][2]

# Concatenate
my_list_full <- c(my_list, info = 0.8642)
my_list_full

# ---SUMMARY---
# Vectors - 1D arrays
# Matrices - 2D arrays
# Dataframes - 2D objects (different columns can be different datatypes)
# Lists - gathers a variety of objects under one name
