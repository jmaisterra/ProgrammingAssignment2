## This Functions can 
## 1) makeCacheMatrix: Create a "Matrix" Object and is able to cache the Matrix and it's inverse, 
## 2) cacheSolve: Computes de Inverse of a "Matrix" returning the chache value if the same "Matrix"
## was the last one used for the inverse computation.

makeCacheMatrix <- function(x = matrix()) {
      cmat <- NULL                                ## Init Matrix used to calculate its Inverse
      minv <- NULL                                ## Init Inverse of the Matrix
      
      set <- function(y) {     
            x <<- y                               ## Set the new Matrix, 
            cmat <<- y                            ## Copy the Matrix to the cache value cmat
            minv <<- NULL                         ## Init the cache Inverse value minv to NULL
      }
      
      get <- function() x                         ## Get the Matrix to compute its Inverse
      
      setinverse <- function(inverse, x) {
            minv <<- inverse                      ## Save the calculated Inverse to the cache value
            cmat <<- x                            ## Save the Matrix used in the calculation to the cache value
      }
      
      getinverse <- function() minv               ## Get the Inverse valua from the cache variable
      
      getlastmatrix <- function() cmat            ## Get the Last Matrix used to compute the Inverse
      
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)               ## Return the list of functions: set, get, setinverse, getinverse
}


cacheSolve <- function(x, ...) {
      cmat <- x$getlastmatrix()                   ## Get the last Matrix used to compute the cache
      minv <- x$getinverse()                      ## Gets the the last computed Inverse from the cache variable
      
      ## If a Matrix was used before AND there is a value in the cache value of the inverse
      ## AND the new Matrix x is equal the one used before, return the cache value
      if( (!is.null(cmat)) && (!is.null(minv)) && identical(camt, x) == TRUE) {
            message("getting cached data")
            return(minv)
      }
      
      vmatrixdata <- x$get()                      ## Get the Matrix data
      minv <- solve(vmatrix)                      ## Calculate it`s Inverse
      x$setinverse(minv, x)                       ## Save the Inverse result and the Matrix Used in the cache variables
      minv                                        ## Return the Inverse result
}

