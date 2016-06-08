#' Draw PCA
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param x dataframe
#'@param id sample id ["XXX"]
#'@param a pc1
#'@param b pc2
#'@export
#'@import ggplot2
#'@import RColorBrewer
#'@examples
#'draw_pca(x, ids="sample1")

draw_pca <- function(x, ids="XXX", pca="PC1", pcb="PC2"){

  sample <- subset(x, pop %in% ids)
  others <- subset(x, !pop %in% ids)
  my_colours <- brewer.pal(n = 12, name = 'Paired')

  # plot PCA with ggplot2
  plt <- ggplot(others, aes(others[pca], others[pcb])) +
    geom_point(aes(colour=pop, shape=pop), size=3.5) +
    scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
    scale_color_manual(values=rep(my_colours, 10)) +
    geom_point(data=sample,colour="blue",pch=15,size=5) +
    guides(col = guide_legend(ncol = 3))

  plt

}
