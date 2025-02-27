## Function that creates matrix object in order to store cache of the inversed matrix
## This function takes one argument, it is square matrix

makeCacheMatrix <- function(matr = matrix()) {
        ## setting inverse var as a null, this variable needed to store inverse matrix in future 
        inv_var <- NULL
        ## setting value to the initial matrix
        set_value <- function(y) {
                matr <<- y
                inv_var <<- NULL
        }
        ## get value of the initial matrix
        get_value <- function() {
                matr
        }
        ## set value to the inverse matrix 
        set_inverse_matr <- function(inverse_matrix) {
                inv_var <<- inverse_matrix
        }
        ## get value of the inverse matrix
        get_inverse_matr <- function() {
                inv_var
        }
        ## list, that contains a list of function calls to store inversed matrix objects
        list(set_value = set_value,
             get_value = get_value,
             set_inverse_matr = set_inverse_matr,
             get_inverse_matr = get_inverse_matr)
}


## This function is used to calculate the inverse of the matrix, provided by the prev function
## It takes matrix (from the prev function) as an input argument, with possible additional
## arguments supported by "..." operator

cacheSolve <- function(matr, ...) {
        ## getting an inverse of the provided square matrix by calling matching function from the makeCacheMatrix
        inv_var <- matr$get_inverse_matr()
        ## the main idea is that we don't need to recalculate the inverse of the matrix,
        ## if we have already calculated the inverse (there is matching data in the inv_var),
        ## then we got the following message and values from cache
        if (!is.null(inv_var)) {
                message("This matrix has already been inversed, values got from cache:")
                return(inv_var)
        }
        ## getting initial matrix data by calling matching function from the makeCacheMatrix
        matr_data <- matr$get_value()
        ## calculating inverse matrix using solve function
        inv_var <- solve(matr_data, ...)
        ## write calculated inverse matrix to the cache
        matr$set_inverse_matr(inv_var)
        ## show calculated inverse matrix
        inv_var
}
        