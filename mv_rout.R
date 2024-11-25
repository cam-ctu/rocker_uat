mv_rout <- function(path="."){
  files <- list.files(path=path, full.name=TRUE, recursive=TRUE)
  change <- grep("*\\.Rout(\\.fail)?$", files, value = TRUE)
  for( f in change){ file.rename(f, paste0(f,".txt"))}
}
