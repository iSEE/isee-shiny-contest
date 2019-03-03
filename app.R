
library(SingleCellExperiment)
sce <- readRDS("allen.subset.rds")

library(iSEE)
library(shiny)
packageVersion("iSEE")

# Preload the tour, so that it opens on startup
tour <- read.delim(system.file(package = "iSEE", "extdata", "intro_firststeps.txt"), header = TRUE, sep = ";", quote = "")
tour <- rbind(
  tour,
  data.frame(
    element="#Disclaimer",
    intro='<b>DISCLAIMER:</b> this demonstration app for the <a href="https://blog.rstudio.com/2019/01/07/first-shiny-contest/">RStudio shiny contest</a> uses the latest <a href="http://bioconductor.org/packages/iSEE/">release</a> version of the iSEE package on Bioconductor. A range of new exciting features are available from the the latest Bioconductor <a href="http://bioconductor.org/packages/devel/bioc/html/iSEE.html">development</a> version, and the very latest features (e.g., multiple selections, voice recognition, updated UI) may be obtained directly from the <code>master</code> branch of our <a href="https://github.com/csoneson/iSEE">GitHub repository</a>.<br/><br/>We encourage you to try them out!'
  )
)

initialPanels <- DataFrame(
    Name = c(
      "Reduced dimension plot 1",
      "Column data plot 1",
      "Feature assay plot 1",
      "Row statistics table 1",
      "Row data plot 1",
      "Sample assay plot 1",
      "Column statistics table 1",
      "Heat map 1"),
    Width = c(4L, 4L, 4L, 4L, 4L, 4L, 8L, 4L)
)


iSEE(sce, tour = tour, initialPanels = initialPanels)
