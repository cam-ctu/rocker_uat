

# Might want to evolve this to read parameters to choose to clear log
# source("edit_log.R"); clear_log()  ....?

if(!file.exists( "log.Rdata") ){
  log <- data.frame(name=character(0),result=integer(0),date_stamp=character(0))
  save(log, file="log.Rdata")
}

# should create the qmd files for each packages testing

 pkgs <- installed.packages()
 #remove ones tested in recommended/base
 pkg_list <- pkgs[pkgs[,"LibPath"]=="/usr/local/lib/R/site-library","Package"]
 # remove cctu as tested seperately, BH has not Rout files..
 pkg_list <- grep("cctu", pkg_list, value = TRUE, invert=TRUE)
 #pkg_list <- grep("BH", pkg_list, value = TRUE, invert=TRUE)
 #pkg_list <- grep("HSAUR3", pkg_list, value = TRUE, invert=TRUE)
 for( pkg in pkg_list){
   #  unlink( paste0("packages/test_",pkg,".qmd"))
   text <- knitr::knit_expand(file="test_package_template.qmd")
   writeLines(text, paste0("packages/test_",pkg,".qmd"))
 }
# pkg <- "BH"
