# Mean

pollutantmean <- function(directory, pollutant, id = 1:332){
  files <- list.files(directory, pattern = '\\.csv', full.names = TRUE)
  tables <- lapply(files[id], read.csv)
  merged <- do.call(rbind, tables)
  m <- mean(merged[[pollutant]], na.rm = TRUE)
  m
}
pollutantmean("specdata", "sulfate", 1:100)
