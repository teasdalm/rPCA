#' Filter pileup
#'
#'R function to filter a pileup file
#'
#'@param pileup_fileinput pileup file
#'@keywords pileup
#'@export
#'@examples
#'draw_pca(evec_df, sample_id="sample1")

filter_pileup <- function(pileup_file){

  # Filter Pileup file
  ba27 <- read.table(pileup_file,
                     comment.char = "",
                     quote = "",
                     stringsAsFactors = FALSE)

}
