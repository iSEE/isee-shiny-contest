# Due to the memory limit on RStudio Cloud sessions, the full "allen" dataset could not be used for the demo.
# This script was run on a local machine to load and subset the "allen" dataset.
# The RDS file containing the subset was then uploaded to a Dropbox account from which it was downloaded from the RStudio Cloud session.
# Please refer to "02-subset-download.R" for that last step.

library(scRNAseq)
data("allen")

# Subset assays ----
assayNames(allen)
assay(allen, "counts") <- assay(allen, "tophat_counts")
for (x in setdiff(assayNames(allen), "counts")) {
  assay(allen, x) <- NULL
}
allen

# Subset colData ----
colnames(colData(allen))
colData(allen) <- colData(allen)[, c("NREADS", "driver_1_s", "dissection_s", "Core.Type", "passes_qc_checks_s")]

# There is no colData ----
rowData(allen)

# Drop metadata ----
metadata(allen) <- list()

# Normalize ----
library(scater)
sce <- as(allen, "SingleCellExperiment")
sce <- normalize(sce)

# Add reduced dimensions ----
sce <- runPCA(sce, ncomponents=4)
sce <- runTSNE(sce)

# Subset features ----
keep <- which(order(rowVars(assay(sce, "logcounts"))) <= 500) # keep 500 most variable
sce <- sce[keep, ]

# Add rowData ----
rowData(sce)$ave_count <- rowMeans(counts(sce))
rowData(sce)$n_cells <- rowSums(counts(sce)>0)
sce

# save to RDS ----
saveRDS(sce, "allen.subset.rds")
