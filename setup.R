requiredPackages <- c("devtools",
                      "jsonlite",
                      "ggplot2",
                      "lubridate",
                      "dplyr",
                      "reshape2",
                      "shiny")
install.packages(requiredPackages)

devtools::install_github('rstudio/shinyapps')

library(jsonlite)
library(shinyapps)

configFilePath <- 'config.json'
config <- fromJSON(configFilePath)

shinyapps::setAccountInfo(name=config$name, 
                          token=config$token,
                          secret=config$secret)


