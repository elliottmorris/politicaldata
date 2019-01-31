
<!-- README.md is generated from README.Rmd. Please edit that file -->
politicaldata 🗳📊
================

[![Build Status](https://travis-ci.com/elliottmorris/politicaldata.svg?branch=master)](https://travis-ci.com/elliottmorris/politicaldata) v0.1.0

*Development in progress*

An R package for acquiring and analyzing political data — including polls, election results, legislator information, and demographic data.

Author: [G. Elliott Morris](https://www.thecrosstab.com)

For more, see [the package's project description my blog](https://www.thecrosstab.com) or [view the vignettes](https://www.thecrosstab.com) *(both are a work in progress)*. You can find many examples of how these data are used in the real world via my interactive R course at DataCamp.com, ["Analyzing Election and Polling Data in R"](https://www.datacamp.com/courses/analyzing-election-and-polling-data-in-r)

Installation
============

The `politicaldata` package is not yet available from CRAN. However, as the landscape of online data and API calls is constantly changing, the development version is likely more useful anyways.

To get the current development version from GitHub:

``` r
## install the remotes package if it's not already
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

## install dev version of rtweet from github
remotes::install_github("elliottmorris/politicaldata")

## load rtweet package
library(politicaldata)
```

Usage
=====

This package provides a variety of functions for quickly accessing different data sources used in political science and analytics. For example, you can download a data.frame of the DW-NOMINATE scores of congressional ideology computed by the [VoteView](https://voteview.com) project at UCLA:

``` r
# import the package
library(politicaldata)

# download the NOMINATE scores for the 116th House
house_ideo <- get_house_nominate(congress = 116)

# download the NOMINATE scores for the Senate in the 116th Congress
senate_ideo <- get_senate_nominate(congress = 116)

# take a look with dplyr::head()
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
head(house_ideo)
#>   congress chamber icpsr state_icpsr district_code state_abbrev party_code
#> 1      116   House 20301          41             3           AL        200
#> 2      116   House 21102          41             7           AL        100
#> 3      116   House 21192          41             2           AL        200
#> 4      116   House 21193          41             5           AL        200
#> 5      116   House 21376          41             1           AL        200
#> 6      116   House 21500          41             6           AL        200
#>   occupancy last_means             bioname bioguide_id born died
#> 1        NA         NA ROGERS, Mike Dennis     R000575 1958   NA
#> 2        NA         NA       SEWELL, Terri     S001185 1965   NA
#> 3        NA         NA        ROBY, Martha     R000591 1976   NA
#> 4        NA         NA          BROOKS, Mo     B001274 1954   NA
#> 5        NA         NA      BYRNE, Bradley     B001289 1955   NA
#> 6        NA         NA  PALMER, Gary James     P000609 1954   NA
#>   nominate_dim1 nominate_dim2 nominate_log_likelihood
#> 1         0.339         0.448                -3.20589
#> 2        -0.390         0.403                -0.34164
#> 3         0.367         0.661                -2.31340
#> 4         0.607        -0.439                -4.34851
#> 5         0.544         0.316                -1.79148
#> 6         0.771        -0.075                -3.21280
#>   nominate_geo_mean_probability nominate_number_of_votes
#> 1                       0.92109                       39
#> 2                       0.99150                       40
#> 3                       0.94514                       41
#> 4                       0.89699                       40
#> 5                       0.95725                       41
#> 6                       0.92463                       41
#>   nominate_number_of_errors conditional nokken_poole_dim1
#> 1                         1          NA             0.561
#> 2                         0          NA            -0.599
#> 3                         1          NA             0.455
#> 4                         3          NA             0.717
#> 5                         1          NA             0.561
#> 6                         2          NA             0.422
#>   nokken_poole_dim2
#> 1            -0.068
#> 2            -0.242
#> 3             0.065
#> 4            -0.377
#> 5            -0.068
#> 6             0.907
```

**A list of functions:**

-   `get_house_nominate()` returns [DW-NOMINATE](https://www.voteview.com/about) ideology scores for each member of the U.S. House of Representatives for a specified congress, else every Representative ever.
-   `get_senate_nominate()` returns [DW-NOMINATE](https://www.voteview.com/about) ideology scores for each member of the U.S. Senate for a specified congress, else every Senator ever.
-   `trump_approval_polls_538()` returns a dataset of approval polls [aggregated by](https://projects.fivethirtyeight.com/trump-approval-ratings/) the folks over at FiveThirtyEight.

\*\*A list of <data:**>

-   `house_116` is a saved copy of the output from `get_house_nominate(congress=116)` run on the last day the package was updated (and thus should only be used for demos, unless you want outdated data).
-   `senate_116` is the same as the above, bur for the Senate. Downloaded via `get_senate_nominate(congress=116)`.
-   `us_polls_history` is a dataset of US presidential election polling from the 1980 through 2016 elections.

Vignettes
=========

*Come back later*

Suggested related packages:
===========================

-   `Rvoteview` provides functions for obtaining roll call voting data, which can thus be analyzed using algorithms from the `pscl` package.
-   `ropercenter` allows you import data from the Roper Center's iPoll directly in R, given that you know the slug of the interested poll.
-   `fivethirtyeight` was developed to distribute the data behind the popular data journalism website, and thus will have some overlap. FiveThirtyEight also releases most of their data [on GitHub](https://github.com/fivethirtyeight/data).
-   `pollstR` provides a way to access the aggregate toplines from Huffington Post Pollster, which is sadly no longer being updated.

Contributions
=============

You should feel free to suggest more data and/or functions to add, open issues, submit pull requests, etc.

Contact
=======

You can reach me by opening an issue, on [Twitter](https://www.twitter.com/gelliottmorris), or via email (but I'd prefer you to communicate primarily via GitHub).

License
=======

This package is open source and released under the MIT License, which only stipulates that you must distribute the License alongside the package. For more details, click on "See License" at the top right of the repository.
