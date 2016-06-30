#' Draw PCA laser names
#'
#'R function draw a PCA from an evec dataframe
#'
#'@param x dataframe of reference data
#'@param y dataframe of sample data
#'@param bam_file_string string to remove from sample names
#'@param size_of_name size of name to plot
#'@export
#'@import ggplot2
#'@import RColorBrewer

draw_pca_laser_names <- function (x,y, bam_file_string = "-merge-rmdup", size_of_name = 3)
{
  sample <- y
  sample$indivID <- gsub(bam_file_string, "", sample$indivID)
  others <- x
  my_colours <- brewer.pal(n = 12, name = "Paired")
  plt <- ggplot(others, aes(-PC1, -PC2)) + geom_point(aes(colour = popID,
    shape = popID), size = 3.5) + scale_shape_manual(values = rep(c(1:10,
    12:20), 10)) + scale_color_manual(values = rep(my_colours,
    10)) + geom_text(data = sample, aes(label = indivID),
                     size_of_name = 3) + guides(col = guide_legend(ncol = 3))
  plt
}
