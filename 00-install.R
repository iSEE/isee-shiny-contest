
# Essentials ----

install.packages("BiocManager")
BiocManager::install("iSEE", version = "3.10")
install.packages("rsconnect")

# GitHub ----

# For some reason rsconnect::deployApp() doesn't seem to like GitHub
# install.packages("devtools")
# devtools::install_github("csoneson/iSEE")
