#' read_evec
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param x evec file
#'@export
#'@import ggplot2
#'@import tidyr
#'@examples
#'draw_pca()

read_evec <- function(x){

  dat <- read.table(x, stringsAsFactors = FALSE)
  dat <- separate(dat, V1, c("breed", "ind"), sep=":")
  names(dat) <- c("breed",
                 "id",
                 "PC1", "PC2", "PC3",
                 "PC4", "PC5", "PC6",
                 "PC7", "PC8", "PC9",
                 "PC10", "CC")
  dat
}
