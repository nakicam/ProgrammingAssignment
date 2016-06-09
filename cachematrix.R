## creating matrix
makeCacheMatrix <- function( m = matrix() ) {
i <- NULL

## creating set function
set <- function( matrix ) {
                  m <<- matrix
                i <<- NULL
         }
    
## creating get function
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


## creating cacheSolve function
cacheSolve <- function(x, ...) {
       m <- x$getInverse()

         if( !is.null(m) ) {
                   message("getting cached data")
                    return(m)
           }

          data <- x$get()
       

           m <- solve(data) %*% data
        
## print matrix
              x$setInverse(m)