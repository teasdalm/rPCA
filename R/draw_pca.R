#' Draw PCA
#'
#' Draw generic PCA of data
#'
#'@param x dataframe
#'@param pc_x x-axis pc [string]
#'@param pc_y y-axis pc [string]
#'@param point_names name to use as name of points [string]
#'@export
#'@import ggplot2
#'@import RColorBrewer
#'

draw_pca <- function(x, point_names, pc_x, pc_y){
  my_colours <- brewer.pal(n = 12, name = 'Paired')
  ggplot(x, aes_string(pc_x, pc_y)) +
    geom_point(aes_string(colour=point_names, shape=point_names), size=3.5) +
    scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
    scale_color_manual(values=rep(my_colours, 10)) +
    xlab(pc_x) +
    ylab(pc_y)
}
