# does nothing at the moment
# should create the qmd files for each packages testing

if(!file.exists( "log.Rdata") ){
  log <- data.frame(name=character(0),result=integer(0),date_stamp=character(0))
  save(log, file="log.Rdata")
}