switch(Sys.info()[['sysname']], Windows = {
    setwd(paste0("C:/Users/", Sys.info()[['login']],"/Box/Exit Polls/exitpoll19KY/"))
}, Darwin = {
    setwd(paste0("/Users/", Sys.info()[['login']],"/Box/Exit Polls/exitpoll19KY/"))
})


btc <- read.csv("Data/Batch_3824965_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList0.csv", stringsAsFactors = F)
repl <- cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL]

btc <- read.csv("Data/Batch_3825091_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList1.csv", stringsAsFactors = F)
repl <- c(repl, cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL])

btc <- read.csv("Data/Batch_3825463_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList2.csv", stringsAsFactors = F)
repl <- c(repl, cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL])

btc <- read.csv("Data/Batch_3825545_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList3.csv", stringsAsFactors = F)
repl <- c(repl, cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL])

btc <- read.csv("Data/Batch_3825570_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList4.csv", stringsAsFactors = F)
repl <- c(repl, cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL])

btc <- read.csv("Data/Batch_3826104_batch_results.csv", stringsAsFactors = F)
cmp <- read.csv("MTurkList5.csv", stringsAsFactors = F)
repl <- c(repl, cmp$SurveyURL[!cmp$SurveyURL %in% btc$Input.SurveyURL])


rm(btc, cmp)

sapply(strsplit(repl, "/"), function(x) x[[7]])


write.table(
    repl,
    paste0("ReplacementList", 1, ".csv"),
    row.names = F,
    quote = F,
    col.names = "SurveyURL"
)
