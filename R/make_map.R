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
  chr <- stringr::str_replace(x[1], "chr", "")
  position <- x[2]
  snp_name <- paste0(stringr::str_replace(x[9], "]", ""), ".1")

  # Write map file with cat
  cat(chr, snp_name, "0", position, '\n', file=outfile, append = TRUE)
}
