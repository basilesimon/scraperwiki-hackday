library(sqldf)
events_data <- read.csv('~/Documents/mpini/hackdays/news_reader_london/output_2013.csv',header=FALSE)
colnames(events_data) <- c("event", "event_size", "datetime", "actor")
events_data <- events_data[events_data$event != 'event',]
fan_data <- sqldf('
    SELECT * FROM events_data
    WHERE event LIKE "%add%"
        OR event LIKE "%fun%"
        OR event LIKE "%follow%"
        OR event LIKE "%fan%"
        OR event LIKE "%miss%"
        OR event LIKE "%visit%"
        OR event LIKE "%want%"
        OR event LIKE "%stand%"
        OR event LIKE "%believe%"
        OR event LIKE "%support%"
        OR event LIKE "%interest%"
        OR event LIKE "%enjoy%"
        OR event LIKE "%back%"
        OR event LIKE "%love%"
        OR event LIKE "%like%"
        OR event LIKE "%sponsor%"
        OR event LIKE "%welcome%"
        OR event LIKE "%likes%"
        OR event LIKE "%care%"
        OR event LIKE "%protect%"
        OR event LIKE "%grant%"
        OR event LIKE "%relation%"
        OR event LIKE "%desire%"
        OR event LIKE "%favour%"
        OR event LIKE "%value%"
        OR event LIKE "%thanks%"
        OR event LIKE "%cheer%"
                  ')

write.csv(fan_data, '~/Documents/mpini/hackdays/news_reader_london/scraperwiki-hackday/data/fan_dataset_2013.csv')



