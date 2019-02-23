
library(rsconnect)
# rsconnect::setAccountInfo(name='kevinrue', token='xxxx', secret='xxx')
options(repos = BiocManager::repositories())
rsconnect::deployApp()
