#' Draw PCA
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param evec_df input dataframe
#'@keywords smartpca
#'@export
#'@import ggplot2
#'@examples
#'draw_pca(evec_df)

draw_pca <- function(evec_df){

  # plot PCA with ggplot2
  plt <- ggplot2::ggplot(evec_df, aes(PC1, PC2)) +
    ggplot2::geom_text(aes(label=Fam_ID, colour = Fam_ID), size=4, vjust=0)

  print(plt)

}
