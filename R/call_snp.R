
call_snp <- function(x){
  alleles <- x[4]
  quality <- x[5]
  coverage <- length(alleles)
  choice <- sample(c(1:coverage),1)
  return(str_sub(alleles, choice, choice))
}
