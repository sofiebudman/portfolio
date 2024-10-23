complement <- function(file){
  dnaSeq<- readLines(file)
  dnaSeq <- paste(dnaSeq, collapse = "")
  compStrand <- character(nchar(dnaSeq))
  
  for (i in seq_len(nchar(dnaSeq))) {
    if(substr(dnaSeq,i,i) == 'A'){
      compStrand[nchar(dnaSeq)-i+1] <- 'T'
    }
    if(substr(dnaSeq,i,i) == 'T'){
      compStrand[nchar(dnaSeq)-i+1] <- 'A'
    }
    
    if(substr(dnaSeq,i,i) == 'C'){
      compStrand[nchar(dnaSeq)-i+1] <- 'G'
    }
    if(substr(dnaSeq,i,i) == 'G'){
      compStrand[nchar(dnaSeq)-i+1] <- 'C'
    }
    
    
  }
  return(paste(compStrand, collapse = ""))
}