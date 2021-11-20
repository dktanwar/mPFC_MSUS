# Libraries required ----
library(data.table)
library(plgINS)
source("salmonImporter.R")

# Annotation database ----
load("./input/gencode.vM18.anno.RData")


# Importing Salmon files ----
salmon <- salmonImporter1(folder = "./input/salmon", anno = anno)


# Calculation of Normalization Factors ----
salmon@norm.factors <- calcNormFactors(salmon@gene.counts)


# PhenoData ----
pheno <- data.frame(row.names = names(salmon), Sample_ID = names(salmon))
pheno$Group <- gsub(pattern = "_S.*", replacement = "", x = pheno$Sample_ID)
pheno$Lane <- gsub(pattern = ".*_", replacement = "", x = pheno$Sample_ID)
pheno <- pheno[colnames(salmon@gene.counts), ]


# Set phenoData of Salmon object ----
salmon@phenoData <- pheno

# Save salmon data as R object ----
save(salmon, file = "./output/mPFC_rnaseq_salmon.tds.RData", compress = T, compression_level = 3)


# SessionInfo ----
cat("# SessionInfo\n")
devtools::session_info()