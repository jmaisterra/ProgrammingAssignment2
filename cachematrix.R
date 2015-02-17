## This Functions can 1) Create a "Matrix" Object and is able to chache it's inverse, 
## and 2) Computes de Inverse of a "Matrix" returning the chache value if the same "Matrix"
## was used before for the computation.

## Function to create a "Matrix" Object and compute its Inverse, returning a cahe value of 
## the inverse if the "Matrix" passed is IDENTICAL to the last one used.

makeCacheMatrix <- function(x = matrix()) {
      cmat <- NULL     ## Init Matrix used to calculate its Inverse
      minv <- NULL     ## Init Inverse of the Matrix
      
      set <- function(y) {     ## Funtion to set the new Matrix, init x, cmat and minv
            x <<- y
            cmat <<- y
            minv <<- NULL
      }
      get <- function() x                                 ## get the Matrix to compute its Inverse
      setinverse <- function(inverse) minv <<- inverse    ## set de Inverse to the cache value
      getinverse <- function() minv                       ## get the Inverse valua from the cache variable
      getlastmatrix <- function() cmat                    ## get the Last Matrix used to compute the inverseInverse valua variable
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
      minv <- x$getinverse()
      if(!is.null(minv) || identical()) {
            message("getting cached data")
            return(m)
      }
      vmatrixdata <- x$get()
      m <- solve(vmatrix)
      x$setmean(m)
      m
}
