#devtools::install_github("DevonDeRaad/species.clusteRs")

#clean package
#library(pkgdown)
#clean_site(pkg = "SNPfiltR")
#library(devtools)
#clean_vignettes(pkg = "SNPfiltR")

#load packages
library(vcfR)
library(SNPfiltR)
library(species.clusteRs)

#read in filtered vcf and make subset example datasets
vcffog<-read.vcfR("~/Desktop/aph.data/unzipped.filtered.vcf")
colnames(vcffog@gt)

#subset to 20 samples (5 cali, 5 island, 5 wood, 5 florida)
vcffog<-vcffog[,c(1:6,34:38,41:45,89:93)]

#remove invariant SNPs
vcffog<-min_mac(vcffog, min.mac = 1)

vcffog
#subset to 500 random SNPs
vcfR.example<-vcffog[sample.int(7589, 500),]

vcfR.example

#save this vcf
write.vcf(vcfR.example, file = "~/Downloads/species.clusteRs.example.vcf.gz")

#make example popmap for example vcfR
popmap<-data.frame(id=colnames(vcfR.example@gt)[-1], pop=gsub("A_", "", colnames(vcfR.example@gt)[-1]))
popmap$pop<-gsub("_.*", "", popmap$pop)
popmap$pop<-as.factor(popmap$pop)

#save this popmap and vcfR as available data for the SNPfiltR package
usethis::use_data(popmap,vcfR.example, internal = FALSE, overwrite = T)

#clean global environment
rm(list=ls())

#load and test examples

species.clusteRs::vcfR.example
species.clusteRs::popmap

