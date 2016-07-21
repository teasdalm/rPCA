#' Draw PCA laser
#'
#'R function to draw a PCA from a LASER dataframe
#'
#'@param x dataframe of reference data
#'@param y dataframe of sample data
#'@param pc_a x-axis pc
#'@param pc_b y-axis pc
#'@param bam_file_string string to remove from sample names [NULL]
#'@param plot_names do we want to plot sample names [FALSE]
#'@param size_of_name size of name to plot[3]
#'@export
#'@import ggplot2
#'@import RColorBrewer

draw_pca_laser <- function (x, y=NULL, pc_a="PC1", pc_b="PC2", bam_file_string = NULL, plot_names = FALSE, size_of_name = 3) {
  others <- x
  my_colours <- brewer.pal(n = 12, name = "Paired")

  # do we have sample data
  if(is.null(y)){
    plt <- ggplot(others, aes_string(pc_a, pc_b)) +
      geom_point(aes(colour = popID,shape = popID), size = 3.5) +
      scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
      scale_color_manual(values = rep(my_colours,10))
    plt

  } else {
    sample <- y
    sample$indivID <- gsub(bam_file_string, "", sample$indivID)
    my_colours <- brewer.pal(n = 12, name = "Paired")

    # base plot
    plt <- ggplot(others, aes_string(pc_a, pc_b)) +
      geom_point(aes(colour = popID,shape = popID), size = 3.5) +
      scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
      scale_color_manual(values = rep(my_colours,10))

    # plot with names
    if (plot_names == TRUE){
      plt <- plt +
        geom_text(data = sample, aes(label = indivID),size = size_of_name ) +
        guides(col = guide_legend(ncol = 3))
      plt
    # plot blue squares
    } else{
      plt <- plt +
        geom_point(data=sample,colour="blue",pch=15,size=5) +
        guides(col = guide_legend(ncol = 3))
      plt
    }
  }
}
