rnaToProtein <- function(input){
  seq <- readLines(input)
  dnaSeq <- paste(dnaSeq, collapse = "")
  protein <- character(nchar(dnaSeq)/3)
  for (i in seq_len(nchar(dnaSeq))/3) {
    i
  }
  
  
}