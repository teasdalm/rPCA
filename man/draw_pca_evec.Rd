% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw_pca_evec.R
\name{draw_pca_evec}
\alias{draw_pca_evec}
\title{Draw PCA evec}
\usage{
draw_pca_evec(x, ids = NULL, pc_x = "PC1", pc_y = "PC2",
  plot_names = FALSE, size_of_name = 3)
}
\arguments{
\item{x}{dataframe}

\item{ids}{sample ids}

\item{pc_x}{x-axis pc}

\item{pc_y}{y-axis pc}

\item{plot_names}{do we want to plot sample names}

\item{size_of_name}{size of name to plot}
}
\description{
R function draw a PCA from a smartpca/evec dataframe
}
\examples{
draw_pca_evec(x, ids=c("Sample1", "Sample2"), plot_names=TRUE)
}

