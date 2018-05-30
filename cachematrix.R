## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#This function returns a list of four functions that allow to store 
#a chosen matrix in the parent environement, to read it and to transfer the inverse 
#of the matrix to the i variable

makeCacheMatrix <- function(x = matrix()) {

        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) i <<- solve
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}


## Write a short comment describing this function
# this function verfies if i is already calculated or null, 
#if it is null, (the looked up matrix has been reassigned or just assigned)
#it computes the inverse and transfers it to the root i via the above function
#else it retreives it in parent environment variable i and stops

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i<- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}
