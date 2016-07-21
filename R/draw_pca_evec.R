#' Draw PCA evec
#'
#'R function draw a PCA from a smartpca/evec dataframe
#'
#'@param x dataframe
#'@param ids sample ids
#'@param pc_a x-axis pc
#'@param pc_b y-axis pc
#'@param plot_names do we want to plot sample names
#'@param size_of_name size of name to plot
#'@export
#'@import ggplot2
#'@import RColorBrewer
#'@examples
#'draw_pca_evec(x, ids=c("Sample1", "Sample2"), plot_names=TRUE)

draw_pca_evec <- function(x, ids=NULL, pc_a="PC1", pc_b="PC2", plot_names =FALSE, size_of_name = 3){

  my_colours <- brewer.pal(n = 12, name = 'Paired')

  if(is.null(ids)){
    others <- x
    plt <- ggplot(others, aes_string(pc_a, pc_b)) +
      geom_point(aes(colour=pop, shape=pop), size=3.5) +
      scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
      scale_color_manual(values=rep(my_colours, 10))
    plt
  } else{

    sample <- subset(x, pop %in% ids)
    others <- subset(x, !pop %in% ids)

    # The base plot
    plt <- ggplot(others, aes_string(pc_a, pc_b)) +
      geom_point(aes(colour=pop, shape=pop), size=3.5) +
      scale_shape_manual(values = rep(c(1:10,12:20), 10)) +
      scale_color_manual(values=rep(my_colours, 10))

    # no names plot blue squares
    if(plot_names == FALSE){
      plt <- plt +
        geom_point(data=sample,colour="blue",pch=15,size=5) +
        guides(col = guide_legend(ncol = 3))

      plt
      # plot names
    } else{
      plt <- plt +
        geom_text(data = sample, aes(label = id),size = size_of_name) +
        guides(col = guide_legend(ncol = 3))
      plt
    }
  }
}

