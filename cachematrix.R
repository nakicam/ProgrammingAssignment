
## This function creates a special "matrix" object 
## that can cache its inverse.
makeCacheMatrix <- function( m = matrix() ) {
i <- NULL
## creating set function for the matrix
set <- function( matrix ) {
                  m <<- matrix
                i <<- NULL
         }
## creating get function for the matrix
get <- function() {

      m
           }
            setInverse <- function(inverse) {
                 i <<- inverse
               }
              getInverse <- function() {
                 
                     i
                }
               list(set = set, get = get,
                              setInverse = setInverse,
                              getInverse = getInverse)
           }

## This function computes the inverse of the special 
## "matrix" returned by makeCacheMatrix above. If the 
## inverse has already been calculated (and the matrix
## has not changed), then the cachesolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) {
       m <- x$getInverse()

         if( !is.null(m) ) {
                   message("getting cached data")
                    return(m)
           }

          data <- x$get()
           m <- solve(data, ...)
## print the inversed matrix
              x$setInverse(m)
              m
              }
              
