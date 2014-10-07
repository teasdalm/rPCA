#' Draw PCA
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param evec_df input dataframe
#'@param sample_id
#'@keywords smartpca
#'@export
#'@import ggplot2
#'@examples
#'draw_pca(evec_df)

draw_pca <- function(evec_df, sample_id){

  sample <- dat[evec_df$Fam_ID == "KRP",]
  others <- dat[evec_df$Fam_ID != "KRP",]

  # plot PCA with ggplot2
  plt <- ggplot2::ggplot(others, ggplot2::aes(PC1, PC2)) +
    ggplot2::geom_text(ggplot2::aes(label=Fam_ID, colour = Fam_ID), size=4, vjust=0) +
    ggplot2::geom_point(data=sample,colour="blue",pch=15,size=5)

  print(plt)

}
