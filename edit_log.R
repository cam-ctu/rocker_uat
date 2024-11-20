edit_log <- function(name="dummy",result=1,date_stamp=as.character(Sys.time())){
  load("log.Rdata")
  log <- rbind(log,c(name, result, date_stamp))
  save(log, file="log.Rdata")
  # This doesn;t keep the correct variable names
  # It needs to be able to overwrite previous entires by matching name
}