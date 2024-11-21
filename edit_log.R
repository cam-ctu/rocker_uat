edit_log <- function(name="dummy",result=1,date_stamp=as.character(Sys.time())){
  load("log.Rdata")
  old <- log
  # It needs to be able to overwrite previous entries by matching name
  index <- log$name!=name
  log <- log[index,]
  
  log <- rbind(log,
               data.frame(name=name, result=result, date_stamp=date_stamp)
               )
  # This keeps the correct variable names
  save(log, file="log.Rdata")
  invisible(old)
}

clear_log <- function(){
  load("log.Rdata")
  old <- log
  log <- data.frame(name=character(0),result=integer(0),date_stamp=character(0))
  save(log, file="log.Rdata")
  invisible(old)
}


# edit_log("mew",0)
# load("log.Rdata")
# log
# df <- clear_log()
# df