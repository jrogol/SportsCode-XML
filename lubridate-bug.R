library(tidyverse)
library(lubridate)

test_df <- tribble(
  ~code,~start, ~end,
  "a", 11, 21,
  "b", 55, 100,
  "c", 553, 607
)

mutated <- test_df %>% 
  mutate_at(c("start","end"), lubridate::dseconds) %>% 
  mutate_at(vars(start,end), as.Date,origin = Sys.Date()) %>% 
  mutate(intr = interval(start,end),
         dur = as.duration(intr))

# This Equates to TRUE
a <- mutated %>% 
  slice(3) %>%
  select(intr)
b <- mutated$intr[3]

a == b
# Even though:
mutated %>% 
  +   slice(3) %>%
  +   select(intr)
# 2018-05-09 00:00:11 UTC--2018-05-09 00:01:05 UTC

mutated$intr[3]
# 2018-05-09 00:09:13 UTC--2018-05-09 00:10:07 UTC

# This is a known issue with lubridate and other S4 objects and dplyr, since
# Feb. 2017. They're working on it, but more information is available a tthe
# following GitHub issue: https://github.com/tidyverse/dplyr/issues/2432
