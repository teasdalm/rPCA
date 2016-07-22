#' Int PCA evec
#'
#'Experimental R function draw an interactive PCA from a smartpca/evec dataframe
#'
#'@param x dataframe
#'@export
#'@import ggvis

int_pca_evec <- function(x){

  x %>%
    ggvis(x=input_select(label="PC-X-axis",choices=names(x)[c(-1,-2,-13)],map=as.name),
          key := ~id,
          y= input_select(label="PC-Y-axis",choices=names(x)[c(-1,-2,-13)],map=as.name),
          fill= ~pop) %>%
    layer_points() %>%
    add_tooltip(all_values, "hover")
}

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x), ": ", format(x), collapse = "<br />")
}
