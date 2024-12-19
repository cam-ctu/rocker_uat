
df <- curl::curl("https://hub.docker.com/v2/repositories/shug0131/cctu/tags?page_size=10000") |>
readLines() |>
jsonlite::fromJSON()

df <- df$results[, c("name","last_updated", "digest")]
index <- grep("\\d\\.\\d\\.\\d", df$name)
df <- df[index,]
names(df) <- c("version", "date","digest")

jsonlite::toJSON(df, dataframe="columns") |>
  write(file="versions/versions.json")
