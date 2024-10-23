countPointMutations <- function(seq1, seq2){
  numDiff <- 0
  for(i in 1:(max(nchar(seq1),nchar(seq2)))){
    if(substr(seq1, i, i) != substr(seq2, i, i)){
      numDiff <- numDiff +1
      
    }
  }
  return(numDiff)
}
