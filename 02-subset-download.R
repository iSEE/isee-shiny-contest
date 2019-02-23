# Due to the memory limit on RStudio Cloud sessions, the full "allen" dataset could not be used for the demo.
# This script was run from the RStudio Cloud session to download a subset of the data, preprocessed on a local machine.
# Please refer to "01-subset-allen.R" for the preprocessing.


BiocManager::install("BiocFileCache")

library(BiocFileCache)
bfc <- BiocFileCache()

url <- "https://www.dropbox.com/s/yps03y6ws8rtc1h/allen.subset.rds?dl=1"
if (identical(nrow(bfcquery(bfc, "AllenSubset")), 0L)) {
  add5 <- bfcadd(bfc, "AllenSubset", fpath=url)
}
rid5 <- names(add5)

file.copy(add5, "allen.subset.rds")
