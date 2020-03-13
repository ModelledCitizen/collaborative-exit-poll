
UnlikelyTools::set_wd("collaborative-exit-poll", verbose = T)


write.table(
  paste0(
    "http://unlikelyvolcano.com/collaborative-exit-poll/scans/2020/nh-p/",
    list.files("scans/2020/nh-p")
  ),
  "mturk-ul/nh-p-1.csv",
  row.names = F,
  quote = F,
  col.names = "PDFURL"
)

write.table(
  paste0(
    "http://unlikelyvolcano.com/collaborative-exit-poll/scans/2020/tx-p/",
    list.files("scans/2020/tx-p")
  ),
  "mturk-ul/tx-p-1.csv",
  row.names = F,
  quote = F,
  col.names = "PDFURL"
)
