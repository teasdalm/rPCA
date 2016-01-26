rPCA
====
__NB!__ very much alpha

* Install.

```R
devtools::install_github("teasdalm/rPCA")
library(rPCA)
```

* Read evec file.

```R 
tab <- read_evec("file.evec")`
```
* Draw PCA all samples.

```R
draw_pca(tab)`
```

* Draw PCA highlighting family id.

```R
draw_pca(tab, FAMILY_ID)`
```
