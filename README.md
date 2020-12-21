
This script attempts to produce WIMD 2019 ranks for MSOAs.

(You can find the output of the script in the *output* directory.)

# WIMD? MSOAs?

The Welsh Index of Multiple Deprivation (WIMD) ranks 1909 small areas of Wales from most to least deprived. These small areas are known as Lower Super Output Areas (LSOAs). It's useful for many things, including investigating if other metrics are related to deprivation.

Some data from other sources, for example rates of COVID-19 cases, is only made available for slightly larger areas called Middle Super Output Areas (MSOAs). This makes it difficult to investigate how this data compares with WIMD.

This script takes the scores behind the WIMD 2019 LSOA ranks, weights them by mid-2018 population estiamtes, and uses these population-weighted scores to generate ranks for the 410 MSOAs in Wales.

This is *not* the *only* way you might try to generate MSOA WIMD ranks or similar metrics. (You could look at the proportion of the population in an MSOA that lives in the most deprived 25% of LSOAs for example.)

# Using WIMD

Always use WIMD ranks (or quintiles or deciles etc.) when investigating how another measure relates to deprivation. (Do *not* use raw WIMD scores).

If you're looking at an area smaller than all of Wales, e.g. Merthyr Tydfil, then consider reranking *within* that area.

# Source data

I believe all the data is licensed under either the Open Government License or Open Parliament License.

## Geography lookups 
https://statswales.gov.wales/Catalogue/Community-Safety-and-Social-Inclusion/Welsh-Index-of-Multiple-Deprivation

## WIMD index and domain scores by small areas

https://gov.wales/welsh-index-multiple-deprivation-full-index-update-ranks-2019

## Mid-2018 population estimates

https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates

## House of Commons Library MSOA names

https://visual.parliament.uk/msoanames

