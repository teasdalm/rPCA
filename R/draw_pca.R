#' Draw PCA
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param evec_df input dataframe
#'@param sample_id ["XXX"]
#'@keywords smartpca
#'@export
#'@import ggplot2
#'@examples
#'draw_pca(evec_df, sample_id="sample1")

draw_pca <- function(evec_df, sample_id="XXX"){

  sample <- evec_df[evec_df$Fam_ID == sample_id,]
  others <- evec_df[evec_df$Fam_ID != sample_id,]

  # plot PCA with ggplot2
  plt <- ggplot2::ggplot(others, ggplot2::aes(PC1, PC2)) +
    ggplot2::geom_text(ggplot2::aes(label=Fam_ID, colour = Fam_ID), size=4, vjust=0) +
    ggplot2::geom_point(data=sample,colour="blue",pch=15,size=5) +
    guides(col = guide_legend(ncol = 3)) + 
    theme(legend.position="none")

  print(plt)

}
