
<!-- README.md is generated from README.Rmd. Please edit that file -->

# politicaldata

[![Build
Status](https://travis-ci.com/elliottmorris/politicaldata.svg?branch=master)](https://travis-ci.com/elliottmorris/politicaldata)
[![CRAN
status](https://www.r-pkg.org/badges/version/politicaldata)](https://cran.r-project.org/package=politicaldata)
[![Monthly
Downloads](https://cranlogs.r-pkg.org/badges/politicaldata)](https://cran.r-project.org/package=politicaldata)
[![Weekly
Downloads](https://cranlogs.r-pkg.org/badges/last-week/politicaldata)](https://cran.r-project.org/package=politicaldata)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/politicaldata)](https://cran.r-project.org/package=politicaldata)
Dev: v0.1.3

A R package for acquiring and analyzing political data — including
polls, election results, legislator information, and demographic data.

Author: [G. Elliott Morris](https://www.thecrosstab.com)

For more, visit the package documentation website
[here](https://elliottmorris.github.io/politicaldata/), especially the
[the
vignette](https://elliottmorris.github.io/politicaldata/articles/politicaldata.html).

For *even* more, see [the package’s project description my
blog](https://www.thecrosstab.com/project/politicaldata-package/) or
[view the vignettes](https://github.com/elliottmorris/politicaldata)
*(vignettes area work in progress)*. You can find many examples of how
these data are used in the real world via my interactive R course at
DataCamp.com, [“Analyzing Election and Polling Data in
R”](https://www.datacamp.com/courses/analyzing-election-and-polling-data-in-r).

For *even even* more, I’m in the process of writing a detailed guide on
using R for analyzing political data, [*Analyzing Political Data in R
*](https://elliottmorris.github.io/R-political-data-book/), that uses
many of the functions and datasets from this package. The example use
cases extend beyond those in the function documentation and this readme.

# Installation

Install the `politicaldata` package from CRAN:

``` r
# install politicaldata from CRAN
install.packages('politicaldata')

# load the politicaldata package
library(politicaldata)
```

As the landscape of online data and API calls is constantly changing,
the development version is likely to contain quicker bug fixes and
integration of new data. You can instill the dev version using the
`remotes::install_github()` workflow outlined here:

To get the current development version from GitHub:

``` r
# install the remotes package if it's not already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

# install dev version of politicaldata from github
remotes::install_github("elliottmorris/politicaldata")

# load the politicaldata package
library(politicaldata)
```

# Usage

This package provides a variety of functions for quickly accessing
different data sources used in political science and analytics. For
example, you can download a data.frame of the DW-NOMINATE scores of
congressional ideology computed by the [VoteView](https://voteview.com)
project at UCLA:

``` r
# import the package
library(politicaldata)

# download the NOMINATE scores for the 116th House
house_ideo <- get_house_nominate(congress = 116)

# download the NOMINATE scores for the Senate in the 116th Congress
senate_ideo <- get_senate_nominate(congress = 116)

# take a look with dplyr::head()
suppressMessages(library(dplyr))

head(house_ideo[1:5])
#>   congress chamber icpsr state_icpsr district_code
#> 1      116   House 20301          41             3
#> 2      116   House 21102          41             7
#> 3      116   House 21192          41             2
#> 4      116   House 21193          41             5
#> 5      116   House 21376          41             1
#> 6      116   House 21500          41             6
```

**A list of functions:**

  - `get_house_nominate()` returns
    [DW-NOMINATE](https://www.voteview.com/about) ideology scores for
    each member of the U.S. House of Representatives for a specified
    congress, else every Representative ever.
  - `get_senate_nominate()` returns
    [DW-NOMINATE](https://www.voteview.com/about) ideology scores for
    each member of the U.S. Senate for a specified congress, else every
    Senator ever.
  - `trump_approval_polls_538()` returns a dataset of approval polls
    [aggregated
    by](https://projects.fivethirtyeight.com/trump-approval-ratings/)
    the folks over at FiveThirtyEight.
  - `get_cap_mip()` returns a historical dataset of the aggregated
    responses to Gallup’s Most Important Problem questions, coded by
    major topic. Part of a suite of functions for obtaining data from
    the [Comparative Agendas
    Project](https://www.comparativeagendas.net).

**A list of datasets:**

  - `house_116` is a saved copy of the output from
    `get_house_nominate(congress=116)` run on the last day the package
    was updated (and thus should only be used for demos, unless you want
    outdated data).
  - `senate_116` is the same as the above, bur for the Senate.
    Downloaded via `get_senate_nominate(congress=116)`.
  - `us_polls_history` is a dataset of US presidential election polling
    from the 1980 through 2016 elections.
  - `house_results` is a dataset of results for elections to the US
    House of Representatives that occurred from 1976 to 2018
  - `pres_results_by_cd` is a dataset of results for presidential
    elections broken down by congressional district from 1990 to 2016

# Vignettes

There are vignettes. They are in the package documentation. You can see
them online in this repository or the docs
[website](https://elliottmorris.github.io/politicaldata/).

# Suggested related packages:

  - `Rvoteview` provides functions for obtaining roll call voting data,
    which can thus be analyzed using algorithms from the `pscl` package.
  - `ropercenter` allows you import data from the Roper Center’s iPoll
    directly in R, given that you know the slug of the interested poll.
  - `fivethirtyeight` was developed to distribute the data behind the
    popular data journalism website, and thus will have some overlap.
    FiveThirtyEight also releases most of their data [on
    GitHub](https://github.com/fivethirtyeight/data).
  - `pollstR` provides a way to access the aggregate toplines from
    Huffington Post Pollster, which is sadly no longer being updated.

# Contributions

You should feel free to suggest more data and/or functions to add, open
issues, submit pull requests, etc.

# Contact

You can reach me by opening an issue, on
[Twitter](https://www.twitter.com/gelliottmorris), or via email (but I’d
prefer you to communicate primarily via GitHub).

# License

This package is open source and released under the MIT License, which
only stipulates that you must distribute the License alongside the
package. For more details, click on “See License” at the top right of
the repository.
