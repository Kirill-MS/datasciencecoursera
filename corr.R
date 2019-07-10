# Correlation

corr <- function(repository, threshold = 0){
  list <- list.files(repository, pattern = "*.csv", full.names = T)
  tables <- lapply(list, read.csv)
  result <- numeric(length(tables))
  for(i in 1:length(tables)){
    result[i] <- if(nrow(tables[[i]][complete.cases(tables[[i]]),]) < threshold){0} else {
      cor(tables[[i]][["nitrate"]],tables[[i]][["sulfate"]], use = "na.or.complete")
      # cor(tables[[i]][["sulfate"]],tables[[i]][["nitrate"]], use = "complete.obs")
    }
  }
  result
}

corvector <- corr("specdata", 150)
head(corvector)
summary(corvector)
length(corvector)
