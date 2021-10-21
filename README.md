
<!-- README.md is generated from README.Rmd. Please edit that file -->

# species.clusteRs

<!-- badges: start -->

![CRAN-status](https://www.r-pkg.org/badges/version-last-release/species.clusteRs)
![CRAN-Downloads](https://cranlogs.r-pkg.org/badges/grand-total/species.clusteRs)
![License](https://img.shields.io/badge/license-MIT-red.svg)
<!-- badges: end -->

species.clusteRs is an in-development package for performing
clustering-based species delimitation on SNP data from natural
populations.

## Installation

You can install the development version from
[GitHub](https://github.com/) using the following code:

``` r
# install.packages("devtools")
devtools::install_github("DevonDeRaad/species.clusteRs")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(species.clusteRs)
## basic example code for unsupervised clustering using PCA for dimensionality reduction
pcs<-cluster_pca(vcfR = species.clusteRs::vcfR.example,
            popmap = species.clusteRs::popmap)
#> Loading required namespace: adegenet
#> Registered S3 method overwritten by 'spdep':
#>   method   from
#>   plot.mst ape
```

<img src="man/figures/README-example-1.png" width="100%" /><img src="man/figures/README-example-2.png" width="100%" /><img src="man/figures/README-example-3.png" width="100%" />

``` r
#basic example code for using tsne for dimensionality rection
tsne<-cluster_tsne(vcfR = species.clusteRs::vcfR.example,
            popmap = species.clusteRs::popmap)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" /><img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" /><img src="man/figures/README-unnamed-chunk-2-3.png" width="100%" />

``` r
#Does decreasing perplexity improve cluster discrimination?
tsne<-cluster_tsne(vcfR = species.clusteRs::vcfR.example,
            popmap = species.clusteRs::popmap,
            perplexity = 3)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" /><img src="man/figures/README-unnamed-chunk-3-2.png" width="100%" /><img src="man/figures/README-unnamed-chunk-3-3.png" width="100%" />
