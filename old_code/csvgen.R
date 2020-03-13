switch(Sys.info()[['sysname']], Windows = {
    setwd(paste0("C:/Users/", Sys.info()[['login']],"/Box/Exit Polls/exitpoll19KY/"))
}, Darwin = {
    setwd(paste0("/Users/", Sys.info()[['login']],"/Box/Exit Polls/exitpoll19KY/"))
})
i <- 0

for (filenm in list.files("Uploaded Surveys")) {
    cat(filenm, "\n")
    cmd <-
        paste0(
            'pdftk.exe "C:\\Users\\davde\\Box\\Exit Polls\\exitpoll19KY\\Uploaded Surveys\\',
            filenm,
            '" burst output "C:\\Users\\davde\\Box\\Exit Polls\\exitpoll19KY\\Split Surveys\\',
            strsplit(filenm, ".pdf")[[1]][1],
            '_Part%d.pdf"'
        )
    system(cmd)
}



fls <- list.files("Split Surveys")

nms <- paste0("http://danhopkins.org/surveys/exitpolls/KY2019General/", fls)

if (i != 0) {
    old <- c()
    for (j in 0:(i-1)) {
        ino <- read.csv(paste0("MTurkList", j, ".csv"), stringsAsFactors = F)[[1]]
        old <- c(old, ino)
    }
    rm(j, ino)
    nms <- nms[!nms %in% old]
}


#nms <- c(nms, repl)
#nms <- nms[2:length(nms)]

write.table(
    nms,
    paste0("MTurkList", i, ".csv"),
    row.names = F,
    quote = F,
    col.names = "SurveyURL"
)

i <- i + 1




