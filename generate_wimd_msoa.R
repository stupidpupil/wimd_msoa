library(tidyverse)

lsoa_wimd <- readODS::read_ods("data/wimd-2019-index-and-domain-scores-by-small-area_0.ods", sheet=2, skip=2) %>% tibble()
lsoa_pops <- readxl::read_xlsx("data/SAPE21DT1a-mid-2018-on-2019-LA-lsoa-syoa-estimates-formatted.xlsx", sheet=4, skip=3) %>% 
  filter(`Area Codes` %>% str_detect("^W01")) %>%
  rename(`LSOA Code` = `Area Codes`)

lsoa_wimd <- lsoa_wimd %>%
  left_join(lsoa_pops %>% select(`LSOA Code`, `All Ages`), by="LSOA Code") 

stopifnot(lsoa_wimd %>% filter(is.na(`All Ages`)) %>% nrow() == 0 )

lsoa_to_msoa <- readODS::read_ods("data/Geography lookups - match LSOA to different geography groups.ods", sheet=2) %>%
  tibble() %>%
  rename(
    `LSOA Code` = `Lower Layer Super Output Area (LSOA) Code`,
    `MSOA Code` = `Middle Layer Super Output Area (MSOA) Code`,
    `MSOA Name` = `Middle Layer Super Output Area (MSOA) Name`,
    )

lsoa_wimd <- lsoa_wimd %>%
  left_join(lsoa_to_msoa %>% select(`LSOA Code`, `MSOA Code`, `MSOA Name`), by="LSOA Code")

stopifnot(lsoa_wimd %>% filter(is.na(`MSOA Code`)) %>% nrow() == 0 )

msoa_wimd <- lsoa_wimd %>% 
  mutate(Pop.weighted.WIMD = `WIMD 2019` * `All Ages`) %>%
  group_by(`MSOA Code`, `MSOA Name`) %>%
  summarise(
    `Total population` = sum(`All Ages`),
    `WIMD 2019` = sum(Pop.weighted.WIMD)/(`Total population`),
    `Local Authority English Name` = first(`Local Authority Name`)
    ) %>%
  ungroup() %>%
  mutate(
    `WIMD 2019 rank` = rank(`WIMD 2019`),
    `WIMD 2019` = NULL
  ) %>%
  arrange(-`WIMD 2019 rank`)

msoa_hocl_names <- read_csv("data/MSOA-Names-v1.1.0.csv") %>%
  filter(msoa11cd %>% str_detect("^W")) %>%
  rename(
    `MSOA Code` = msoa11cd,
    `MSOA HoCL English Name` = msoa11hclnm,
    `MSOA HoCl Welsh Name` = msoa11hclnmw
    ) 

msoa_wimd <- msoa_wimd %>%
  left_join(
    msoa_hocl_names %>% select(`MSOA Code`, `MSOA HoCL English Name`, `MSOA HoCl Welsh Name`),
    by = "MSOA Code"
    )

msoa_wimd %>% write_csv("output/wimd_msoa.csv")