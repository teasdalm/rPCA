rPCA
====

Some R functions to draw PCAs from smartpca and LASER data  
NB! still under testing

### Requires

* tidyr
* ggplot2
* RColourBrewer

### Install

```R
devtools::install_github("teasdalm/rPCA")
library(rPCA)
```

### Examples 

* Read smartpca data and plot PCA of reference data and samples

```R 
tab <- read_evec("file.evec")
draw_pca_evec(tab, ids=c("Sample1", "Sample..n"))
```

* Read laser data and draw pca of reference data and samples

```R
dat <- read.table("file.RefPC.coord", header = TRUE)
samples <- read.table("file.SeqPC.coord", header = TRUE)
draw_pca_evec(dat, samples)
```
