# Instructions on how to run the code can be found
# in README.md along with sample output.

# The makeCacheMatrix function is used to create
# a matrix for which the inverse gets cached when
# it is first calculated. After this the inverse 
# can be retrieved from the cache instead of recomputed 
# as long as the contents of the matrix haven't changed.
#
# List of functions in makeCacheMatrix:
# - set: set contents of matrix
# - get: get contents of matrix
# - setInverse: set contents of inverted matrix
# - getInverse: get contents of inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    # Initially inverted matrix is empty
    m <- NULL
    
    # Set contents of the matrix
    set <- function(y) {
            x <<- y
            # When set is used to alter or 
            # reinitiate the contents of the matrix, 
            # inverted matrix is emptied.
            m <<- NULL
    }

    # Retrieve contents of matrix
    get <- function() x
    # Set contents of inverted matrix
    setInverse <- function(solve) m <<- solve
    # Retrieve contents of inverted matrix
    getInverse <- function() m

    # Print a list of the functions to the screen
    list(
        set = set, 
        get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


# The cacheSolve function is used to either compute 
# the inverse of a matrix created with makeCacheMatrix
# or if the results have already been cached previously,
# it will retrieve the inverted matrix from the cache.

cacheSolve <- function(x, ...) {
    # Attempt to retrieve the cached inverse matrix
    m <- x$getInverse()

    # Check if a value has been assigned to m,
    # the inverted matrix. If a value was found in
    # the cache, print message and return inverted matrix.
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
        # If this loop was entered, execution will stop here.
    }
    
    # If no cached value was found for m, get the contents
    # of the matrix and assign to data variable
    data <- x$get()

    # Calculate the inverse of matrix stored in data variable
    # and assign to m
    m <- solve(data, ...)

    # Cache the inverse matrix using the setInverse function
    x$setInverse(m)

    # Print inverted matrix to screen
    m
}
