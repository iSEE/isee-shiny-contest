
library(SingleCellExperiment)
sce <- readRDS("allen.subset.rds")

library(iSEE)
library(shiny)

# Preload the tour, so that it opens on startup
tour <- read.delim(system.file(package = "iSEE", "extdata", "intro_firststeps.txt"), header = TRUE, sep = ";")
packageVersion("iSEE")
iSEE(sce, tour = tour)
