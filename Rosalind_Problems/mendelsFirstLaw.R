mendelsFirstLaw <- function(k,m,n){
  total <- k+m+n
  p_homo_dominant <- (k/total) * ((k-1)/(total-1))
  p_dominant_hetero <- 2 * (k / total) * (m / (total - 1)) * 0.75
  p_hetero_hetero <- (m / total) * ((m - 1) / (total - 1)) * 0.25
  p_dominant_recessive  <- 2 * (k / total) * (n / (total - 1)) 
  p_hetero_recessive <- 2 * (m / total) * (n / (total - 1)) * 0.5
  probability <- p_homo_dominant +p_dominant_hetero + p_hetero_hetero + p_dominant_recessive + p_hetero_recessive
  return (probability)
}


