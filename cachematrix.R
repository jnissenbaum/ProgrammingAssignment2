## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#cachematrix takes as input a matrix (local variable x) and returns
# a list with four items--each item is actually a function:
#   get (returns the matrix)
#   set (stores the matrix in the variable "m" in another environment)
#   getinverse (retrieves the inverse by returning "m")
#   setinverse (stores the inverse in "m")

makecachematrix<- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function(){x}
  setinverse <- function(inverse) {m <<- inverse}
  getinverse <- function() {m}
  return(list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse))
}


#cachesolve takes as input a list that is typically the output of a call to 
#  function "cachematrix"
# it checks the value of "m" to see if the inverse was already stored.
# if not already stored, it gets the data from the special list (a matrix)
# and calculates the inverse via the solve function.
# it stores the inverse in variable "m" as well as returns m
cachesolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  return(m)
}