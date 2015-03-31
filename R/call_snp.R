#' call SNPs
#'
#' R function to call SNPs from a pileup dataframe
#'
#'@param x pileup dataframe
#'@keywords Pileup
#'@export
#'@examples
#' call_snp(x)

call_snp <- function(x){
  # select alleles
  alleles <- x["base_calls"]

  # select quality
  quality <- x["qualities"]

  # randomly sample allele and return
  coverage <- length(alleles)
  choice <- sample(c(1:coverage),1)
  return(stringr::str_sub(alleles, choice, choice))
}
