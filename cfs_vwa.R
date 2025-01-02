# CFS VWA data cleaning
# Ran Wei 20250102


# order 1 -----------------------------------------------------------------


df_vwa_order1 <- as.data.frame(read.delim("/Users/ranwei/Dropbox (Personal)/CFS/CFS 2024/CFS_VWA_2025/VW_A_1_Data_Export.csv", header = TRUE, sep = ","))
str(df_vwa_order1)

# only keeping relevant columns
library(dplyr)
df_vwa_order1_select <- df_vwa_order1 %>% select(ParticipantName, StudioTestName, 
                                          RecordingDate, 
                                          MediaName, MediaHeight, MediaWidth,
                                          RecordingResolution, 
                                          RecordingTimestamp, LocalTimeStamp,
                                          ValidityLeft, ValidityRight,
                                          GazePointLeftX..ADCSpx., 
                                          GazePointRightX..ADCSpx.,
                                          GazePointLeftY..ADCSpx.,
                                          GazePointRightY..ADCSpx.,
                                          GazePointX..ADCSpx.,
                                          GazePointY..ADCSpx.)
names(df_vwa_order1_select) <- tolower(names(df_vwa_order1_select))

df_vwa_order1_id_date <- df_vwa_order1_select %>% select(participantname, 
                                                 recordingdate)
df_vwa_order1_id_date <- df_vwa_order1_id_date[!duplicated(df_vwa_order1_id_date$participantname),]

df_vwa_order1_select$id <- df_vwa_order1_select$participantname

df_vwa_order1_select$id[df_vwa_order1_select$participantname == "minmin"] <- 359
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "cui"] <- 347
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "jiaqi"] <- 381
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "xiaoyu"] <- 366
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "yiyi"] <- 358
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "yunfeng"] <- 383
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "qiqi"] <- 368
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "qq"] <- 344
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "shiqi"] <- 378
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "shuo"] <- 369
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "tongyu"] <- 377
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "xiaoxiao"] <- 380
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "xuanxuan"] <- 367
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "xxh"] <- 346
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "yaya"] <- 353
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "youyou"] <- 345
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "yy"] <- 376
df_vwa_order1_select$id[df_vwa_order1_select$participantname == "zijing"] <- 363

df_vwa_order1_select <- df_vwa_order1_select[df_vwa_order1_select$participantname != "P03", ] 
df_vwa_order1_select <- df_vwa_order1_select[df_vwa_order1_select$participantname != "P04", ] 

table(df_vwa_order1_select$id)

# checked: no duplicated names, reasonable duration

# sorting by time under each id

library(dplyr)

# removing child name 
df_vwa_order1_select$participantname <- NULL

df_vwa_order1_select <- df_vwa_order1_select %>%
  group_by(id) %>%
  arrange(recordingtimestamp, .by_group = TRUE)


# order 2 -----------------------------------------------------------------


df_vwa_order2 <- as.data.frame(read.delim("/Users/ranwei/Dropbox (Personal)/CFS/CFS 2024/CFS_VWA_2025/VW_A_2_Data_Export.csv", header = TRUE, sep = ","))
str(df_vwa_order2)

# only keeping relevant columns
library(dplyr)
df_vwa_order2_select <- df_vwa_order2 %>% select(ParticipantName, StudioTestName, 
                                                 RecordingDate, 
                                                 MediaName, MediaHeight, MediaWidth,
                                                 RecordingResolution, 
                                                 RecordingTimestamp, LocalTimeStamp,
                                                 ValidityLeft, ValidityRight,
                                                 GazePointLeftX..ADCSpx., 
                                                 GazePointRightX..ADCSpx.,
                                                 GazePointLeftY..ADCSpx.,
                                                 GazePointRightY..ADCSpx.,
                                                 GazePointX..ADCSpx.,
                                                 GazePointY..ADCSpx.)
names(df_vwa_order2_select) <- tolower(names(df_vwa_order2_select))

df_vwa_order2_id_date <- df_vwa_order2_select %>% select(participantname, 
                                                         recordingdate)
df_vwa_order2_id_date$id_date <- paste(df_vwa_order2_id_date$participantname, df_vwa_order2_id_date$recordingdate, sep = "-")
df_vwa_order2_id_date <- df_vwa_order2_id_date[!duplicated(df_vwa_order2_id_date$id_date),]

df_vwa_order2_select$id_date <- paste(df_vwa_order2_select$participantname, df_vwa_order2_select$recordingdate, sep = "-")
df_vwa_order2_select$id <- df_vwa_order2_select$id_date

df_vwa_order2_select$id[df_vwa_order2_select$id_date == "kexin-7/28/2018"] <- 364
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "tangyuan-7/28/2018"] <- 356
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "beibei-8/7/2018"] <- 357
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "erniu-8/8/2018"] <- 354
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "guoguo-8/2/2018"] <- 379
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "jiaojiao-8/1/2018"] <- 382
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "hx-8/8/2018"] <- 365
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "meili-7/31/2018"] <- 372
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "taotao-7/30/2018"] <- 360
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "tongbao-7/29/2018"] <- 349
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "ttf-8/16/2018"] <- 350
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "xb-8/9/2018"] <- 352
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "yueyue-7/30/2018"] <- 361
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "yueyue-8/4/2018"] <- 375
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "xixi-8/11/2018"] <- 351
df_vwa_order2_select$id[df_vwa_order2_select$id_date == "xixi-8/7/2018"] <- 355

table(df_vwa_order2_select$id)

# checked: no more duplicated names, reasonable duration

# sorting by time under each id

library(dplyr)

# removing child name 
df_vwa_order2_select$participantname <- NULL
df_vwa_order2_select$id_date <- NULL

df_vwa_order2_select <- df_vwa_order2_select %>%
  group_by(id) %>%
  arrange(recordingtimestamp, .by_group = TRUE)


# merging order 1 and 2 ---------------------------------------------------
dim(df_vwa_order1_select)
dim(df_vwa_order2_select)

df_vwa_order12_select <- rbind(df_vwa_order1_select, df_vwa_order2_select)
dim(df_vwa_order12_select)

# moving ID to the first variable 
library(dplyr)
df_vwa_order12_select <- df_vwa_order12_select %>%
  select(id, everything())

write.csv(df_vwa_order12_select, 
          file = "/Users/ranwei/Dropbox (Personal)/CFS/CFS 2024/CFS_VWA_2025/df_vwa_order12_select.csv", row.names = TRUE )

  
  
