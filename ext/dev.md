Dev process
================

An outline of different development processes.

## Package

### Some other stuff

### For release

``` r
## commands used to check the build before pushing to cran

# make sure we save the right internally-necessary data to sysdata.rda
library(politicaldata)
usethis::use_data(cap_major_topics, internal = T)

# clear and restart the R session
rm(list=ls())
.rs.restartR()

# build the new documentation
devtools::document()

# build the package
devtools::build()

# check the package
devtools::check()

# spell check
devtools::spell_check()

# if releasing new version, make clear in news.md

# in terminal, run R CMD check --as-cran <<.tar.gz>> and record any notes in cran-comments.md

# ok, now you can release
devtools::release()
```

## Docs website

From:
<http://lbusettspatialr.blogspot.com/2017/08/building-website-with-pkgdown-short.html?m=1>

### To build the website

``` r
library(pkgdown)
build_site()
```

### To put it on the interwebs

Go to GitHub and turn on a page site

Home location is `https://elliottmorris.github.io/politicaldata/`
