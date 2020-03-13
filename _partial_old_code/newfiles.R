setwd("C:/Users/davde/Box/Exit Polls/exitpoll19KY/")
n <- list.files("Uploaded Surveys")

repeat {
    cat(as.character(Sys.time()))
    if (!identical(list.files("Uploaded Surveys"), n)) {
        cat(": new files added!\n")
        x <- list.files("Uploaded Surveys")[!list.files("Uploaded Surveys") %in% n]
        for (filenm in x) {
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
        n <- length(list.files("Uploaded Surveys"))
        next
    } else {
        cat(": no new files.\n")
        Sys.sleep(1)
    }
}

