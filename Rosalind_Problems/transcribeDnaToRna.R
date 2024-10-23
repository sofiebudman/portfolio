transcribe <- function(file){
  dnaSeq <- readLines(file)
  dnaSeq <- paste(dnaSeq, collapse = "")
  rnaSeq <- character(nchar(dnaSeq))
  
  
  for (i in seq_len(nchar(dnaSeq))){
    if(substr(dnaSeq,i,i) == 'T'){
      rnaSeq[i] <- 'U'
      
    }else{
      rnaSeq[i] <- substr(dnaSeq, i, i)
    }
    
  }
  return(paste(rnaSeq, collapse = ""))
}
