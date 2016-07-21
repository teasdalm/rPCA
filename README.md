rPCA
====

Some R functions to draw PCAs from smartpca and LASER data  
NB! still under testing

### Requires
* devtools
* tidyr
* ggplot2
* RColourBrewer

### Install

* Commands to install.

```R
devtools::install_github("teasdalm/rPCA")
library(rPCA)
```

### Examples 

* Read smartpca data and plot a PCA of reference data and samples.

```R 
tab <- read_evec("file.evec")
draw_pca_evec(tab, ids=c("Sample1", "Sample..n"))
```

* Read LASER data and plot a PCA of reference data and samples.

```R
dat <- read.table("file.RefPC.coord", header = TRUE)
samples <- read.table("file.SeqPC.coord", header = TRUE)
draw_pca_laser(dat, samples)
```

* More help.
```R
?draw_pca_evec
?draw_pca_laser
```
