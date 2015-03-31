#' Make map
#'
#' R function to make map files from a pileup dataframe
#'
#'@param x pileup data frame
#'@param outfile - output file
#'@keywords Pileup
#'@export
#'@examples
#' make_map(pileup_df, "output.test")


make_map <- function(x, outfile){
  # replace chromosome name
  chr <- stringr::str_replace(x["chr"], "chr", "")
  position <- x["position"]
  snp_name <- paste0(x["SNP"], ".1")

  # Write map file with cat
  cat(chr, snp_name, "0", position, '\n', file=outfile, append = TRUE)
}
