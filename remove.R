## Getting and Cleaning Data Project (https://class.coursera.org/getdata-002)
##
## Martin Kersner, m.kersner@gmail.com
##
## created: 04/25/2014
## updated: 04/27/2014

# Function deletes objects from global environment specified by pattern.
# @param  pat Pattern can contain regular expression or simply the name of object
remove <- function(pat)
{
  rm(list=ls(pat=pat, envir=.GlobalEnv), pos = .GlobalEnv)
}