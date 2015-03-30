#' make_plink
#'
#' R function to make PED and map files from a pileup dataframe
#'
#'@param pileup_df
#'@param sample_id ["XXX"]
#'@keywords smartpca
#'@export
#'@import ggplot2
#'@examples
#' make_plink(evec_df, sample_id="sample1")
make_plink <- function(pileup_df, sample_name){

  output_file_base = "~/Desktop/"

  library(stringr)
  alleles <- apply(pileup_df, 1, call_snp)
  sudo_dipoid <- rep(alleles, each=2)

  output_file_ped <- paste0(output_file_base, sample_name, ".ped")

  cat(sample_name, sample_name, "0 0 0 -9", sudo_dipoid, "\n", file = output_file_ped)

  output_file_map <- paste0(output_file_base, sample_name, ".map")

  apply(pileup_df, 1, make_map, outfile = output_file_map )

}
