#' Pileup filter
#'
#' R function filter a pileup file into a dataframe
#'
#'@param pileup_file pileup
#'@keywords Pileup
#'@export
#'@examples
#' call_snp(x)

pileup_filter <- function(pileup_file){

  pileup <- scan(pileup_file,
              what=character(),
              quote="")

  if (stringr::str_sub(pileup[length(pileup)],1,1) == "[") {
    pileup <- pileup[-length(pileup)]
  }

  pileup_df <- as.data.frame(matrix(data = pileup,
                       nrow = length(pileup)/9,
                       ncol = 9,
                       byrow = TRUE))

  pileup_df <- pileup_df[,-c(6:8)]

  pileup_df$V9 <- stringr::str_replace(pileup_df$V9, "]", "")
  names(pileup_df) <- c("chr",
                        "position",
                        "ref",
                        "base_calls",
                        "qualities",
                        "SNP")

  return(pileup_df)
}
