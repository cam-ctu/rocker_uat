
current <- readLines("versions/versions.json") |>
  jsonlite::fromJSON() |>
  as.data.frame()



df <- curl::curl("https://hub.docker.com/v2/repositories/shug0131/cctu/tags?page_size=10000") |>
readLines() |>
jsonlite::fromJSON()

df <- df$results[, c("name","last_updated", "digest")]
index <- grep("\\d\\.\\d\\.\\d", df$name)
df <- df[index,]
names(df) <- c("version", "date","digest")

jsonlite::toJSON(df, dataframe = "columns") |>
  write(file = "versions/versions.json")

# needs to work with revisions and new rows
index <- match(current$version, df$version)
#new rows
extra <- df[-index,]

#revised rows
df <- df[index,]
comp <- current != df
index <- apply(comp, 1, any)
revisions <- df[index, ]

if ( nrow(extra) || nrow(revisions)) {
  rbind( revisions, extra) |> 
  jsonlite::toJSON( dataframe = "columns") |>
   write(file = "versions/change_versions.json")
}

