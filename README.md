
# Politicaldata 🗳📊

[![Build Status](https://travis-ci.com/elliottmorris/politicaldata.svg?branch=master)](https://travis-ci.com/elliottmorris/politicaldata)

**Development in progress**


An R package for acquiring and analyzing political data in R — including downloading polling aggregates and microdata, congressional legislator information, and election results.

---

Author: [G. Elliott Morris](https://www.thecrosstab.com)

For more, see [the package's project file on my blog]() or view the vignettes.

# Installation

The politicaldata package is not yet available from CRAN.

To get the current development version from GitHub:

```
## install the remotes package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("remotes")
}

## install dev version of rtweet from github
remotes::install_github("elliottmorris/politicaldata")

## load rtweet package
library(politicaldata)
```

# Usage

## A list of functions:

- `get_house_nominate()`: Returns [DW-NOMINATE](https://www.voteview.com/about) ideology scores for each member of the U.S. House of Representatives for a specified congress, else every Representative ever.
- `get_senate_nominate()`: Returns [DW-NOMINATE](https://www.voteview.com/about) ideology scores for each member of the U.S. Senate for a specified congress, else every Senator ever.

## Data:

- `house_116`: A saved copy of the output from `get_house_nominate(congress=116)` run on the last day the package was updated (and thus should only be used for demos, unless you want outdated data).
- `senate_116`: The same as the above, bur fot the Senate. Downloaded via `get_senate_nominate(congress=116)`.



