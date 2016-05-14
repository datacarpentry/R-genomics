#### losgatosca.gov/MAP
#### http://www.losgatosca.gov/932/Look-Up-Property---Interactive-GIS-Map

# workspace ---------------------------------------------------------------

set.seed(367)
library(dplyr)
library(magrittr)

setwd("~/Documents/AARUG-R-workshop/")

cats <- read.csv("data/herding-cats.csv", stringsAsFactors = FALSE)

# traits ------------------------------------------------------------------

# give them some colors
coats <- c("brown", "calico", "tabby", "black", "maltese")
probs <- c(.33, .16, .24, .18, .09)

cats$coats <- sample(coats, size = 400, prob = probs, replace = TRUE)

# sex
cats$sex <- sample(c("male", "female"), size = 400, prob = c(.44, .56), replace = TRUE)

# age & weight
cats <- cats %>% 
  mutate(
    age    = rnorm(nrow(cats), mean = 4.3, sd = 4.6),
    age    = ifelse(age < 0, 0.4, age),
    weight = rnorm(nrow(cats), mean = (age / 10) * 9, sd = 1)
  )

# is the cat fixed?
cats <- cats %>% 
  mutate(
    fixed = gsub("[[:alpha:]]", "", street) %>% as.numeric,
    fixed = ifelse(fixed > 15000, 0, 1),
    fixed = ifelse(is.na(fixed), 0, fixed)
  )

# behavior ----------------------------------------------------------------

# range .027 to .11mi^2 (via google)
cats$wander_dist <- nrow(cats) %>% rnorm(.0415, sd = .02)

# make some cats who wander a bit farther
roamers <- sample(1:nrow(cats), 88)
cats[roamers, "wander_dist"] <- rnorm(88, .1015, .02)

cats[roamers, "roamer"]            <- "yes"
cats[is.na(cats$roamer), "roamer"] <- "no"

# the roamers are more likely to not be fixed
cats[roamers[sample(1:88, 16)], "fixed"] <- 0

cats$weight <- cats %$% 
  weight %>%
  {. - (20.4 * cats$wander_dist) + (.09 * cats$age)}

# if the cat is not mature, their wander distance will be between min and median
cats$wander_dist <- cats %$%
  ifelse(
    age < 1,
    sample(0.001:0.042, 1),
    wander_dist
  )

# if you're a heavy cat, you're not walking around that much
# recode their wandering distance to be between minimum and first quartile of wander
cats$wander_dist <- cats %$%
  ifelse(
    weight > 9.318 & wander_dist > .07424,
    sample(.001:.0368, 1),
    wander_dist
  )

# if you're fixed, you wander less
cats$wander_dist <- cats %$%
  ifelse(
    fixed == 1,
    wander_dist - sample(.002:.032, 1),
    wander_dist + sample(.009:.02, 1)
  )

cats <- cats %>% 
  mutate(
    wander_dist = ifelse(weight < 1, sample(0:0.05, 1), wander_dist),
    wander_dist = ifelse(wander_dist < 0, sample(0.001:.019, 1), wander_dist),
    weight      = ifelse(weight < 0, sample(0:3.5, 1), weight)
  )

# cleanup -----------------------------------------------------------------

cats$cat_id <- 1:nrow(cats)

cats <- mutate_each(cats, funs(d = round(., 3)), wander_dist, age, weight)

cats_small <- sample_n(cats, 25) %>% select(-address_full)

write.csv(cats, "data/herding-cats.csv", row.names = FALSE)
write.csv(cats_small, "data/herding-cats-small.csv", row.names = FALSE)
