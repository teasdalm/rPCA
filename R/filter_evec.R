#' Filter evec
#'
#'R function to collect evec file into a dataframe
#'
#'@param evec_file input evec file
#'@keywords smartpca
#'@export
#'@import reshape
#'@examples
#'filter_evec(evec_file)


filter_evec <- function(evec_file){

  ## ----------- Filter evec_file

  # create string to pass to system
  filter_string <- paste("cat ",
                          evec_file,
                          "| sed 's/^ *//g' | tr -s ' '")

  # filter the strings
  filter_raw <- system(filter_string, intern = TRUE)

  ## ----------- create a dataframe
  filter_mx <- t(
    data.frame(
      sapply(filter_raw , function (x)
        strsplit(x, split=" ")[[1]][1:11])
      , stringsAsFactors = FALSE))

  filter_df <- data.frame(filter_mx, stringsAsFactors = FALSE)

  ## ------------ organise dataframe

  # get rid of row names and first row
  rownames(filter_df) <- NULL
  filter_df <- filter_df[-1,]

  # convert to numerics
  for (i in seq(from = 2, to = ncol(filter_df))){
    filter_df[,i] <- as.numeric(filter_df[,i])
  }

  colnames(filter_df) <- c("Sample","PC1","PC2",
                           "PC3","PC4","PC5","PC6",
                           "PC7","PC8","PC9","PC10")

  cbind(reshape2::colsplit(filter_df,
                          split = ":",
                          names = c("Fam_ID", "Sample_ID"))
        , filter_df[2:11])


}
