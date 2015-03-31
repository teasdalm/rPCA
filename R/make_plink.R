#' make_plink
#'
#' R function to make PED and map files from a pileup dataframe
#'
#'@param pileup_file input pileup file
#'@param sample_name imput sample name
#'@keywords Pileup
#'@export
#'@examples
#' make_plink(evec_df, sample_id="sample1")

make_plink <- function(pileup_file, sample_name){

  # make output files
  output_file_base <- tools::file_path_sans_ext(pileup_file)

  # Read pileup file
  message("Reading ", pileup_file)
  pileup_df <- filter_pileup(pileup_file)

  # Get alleles and make sudo dipolid
  alleles <- apply(pileup_df, 1, call_snp)
  sudo_dipoid <- rep(alleles, each=2)

  # make and write ped file
  output_file_ped <- paste0(output_file_base, ".ped")
  message("Making PED file ", output_file_ped)
  cat(sample_name, sample_name, "0 0 0 -9", sudo_dipoid, "\n", file = output_file_ped)

  # Make and output map file
  output_file_map <- paste0(output_file_base, ".map")
  message("Making MAP file ", output_file_map)
  apply(pileup_df, 1, make_map, outfile = output_file_map )

}
