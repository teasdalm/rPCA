#' Draw PCA names
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param x dataframe of reference data
#'@param ids sample id ["XXX"]
#'@param size_of_name size of name to plot
#'@export
#'@import ggplot2
#'@import RColorBrewer

draw_pca_names <- function (x, ids = "XXX", size_of_name = 3)
{
  sample <- subset(x, pop %in% ids)
  others <- subset(x, !pop %in% ids)
  my_colours <- brewer.pal(n = 12, name = "Paired")
  plt <- ggplot(others, aes(PC1, PC2)) + geom_point(aes(colour = pop,
    shape = pop), size = 3.5) + scale_shape_manual(values = rep(c(1:10,
    12:20), 10)) + scale_color_manual(values = rep(my_colours,
    10)) + geom_text(data = sample, aes(label = id),
    size = size_of_name) + guides(col = guide_legend(ncol = 3))
  plt
}
