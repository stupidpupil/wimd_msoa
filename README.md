
This script attempts to produce WIMD 2019 ranks for MSOAs in a **very** dubious manner.

(You can find the output of the script in the *output* directory.)

# WIMD? MSOAs?

The Welsh Index of Multiple Deprivation (WIMD) ranks 1909 small areas of Wales from most to least deprived. These small areas are known as Lower Super Output Areas (LSOAs). It's useful for many things, including investigating if other metrics are related to deprivation.

Some data from other sources, for example rates of COVID-19 cases, is only made available for slightly larger areas called Middle Super Output Areas (MSOAs). This makes it difficult to investigate how this data compares with WIMD.

# Aggregating WIMD to MSOAs

This script combines two different metrics to try to produce WIMD-like ranks for MSOAs:

  1. Proportion of each MSOA's population resident in the most and least deprived LSOAs.
  2. Each MSOA's population-weighted average of its LSOAs' WIMD scores.

## Proportion of each MSOA's population resident in the most and least deprived LSOAs

The first of these starts by looking at the proportion of each MSOA's population in the *50%* most deprived LSOAs, then the *30%* most deprived LSOAs and various other cut-offs, weighted to emphasise some more than others but ensure a decent degree of agreement with all.

## Each MSOA's population-weighted average of its LSOAs' WIMD scores.

The [WIMD guidance](https://gov.wales/sites/default/files/statistics-and-research/2020-06/welsh-index-multiple-deprivation-2019-guidance.pdf#page=12) explictly tells you **not** to do the second of these:

> It is not valid to aggregate the ranks or scores to larger geographies by taking an average of the values for the small areas. 

This population-weighted average is only used as a last resort to try to disambiguate the ranks of the very least and most deprived MSOAs.

# Using these Pseudo-WIMD ranks

Consider using quintiles or deciles.

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

