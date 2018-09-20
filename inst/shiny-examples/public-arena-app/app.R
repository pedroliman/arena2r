library(arena2r)

dir <- system.file("shiny-examples", "arenaapp", package = "arena2r")
setwd(dir)
shiny::shinyAppDir(".")
