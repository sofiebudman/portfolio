countingDnaNucleotides <- function(file){
  seq <- readLines(file)
  seq <- paste(seq, collapse = "")
  seq <- character(nchar(dnaSeq))
  return (stringr::str_count(seq, "A"), stringr::str_count(seq, "C"), stringr::str_count(seq, "G"), stringr::str_count(seq, "T"))
}
