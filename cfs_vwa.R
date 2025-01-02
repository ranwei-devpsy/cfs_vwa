# CFS VWA data cleaning
# Ran Wei 20250102

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

# sorting by time under each id

library(dplyr)

# removing child name 
df_vwa_order1_select$participantname <- NULL

df_vwa_order1_select <- df_vwa_order1_select %>%
  group_by(id) %>%
  arrange(recordingtimestamp, .by_group = TRUE)





  
  
  
  
