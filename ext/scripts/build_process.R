## commands used to check the build before pushing to cran

# clear and restart the R session
rm(list=ls())
.rs.restartR()

# build the new documentation
devtools::document()

# build the pacage
devtools::build()

# check the package
devtools::check()

# spell check
devtools::spell_check()

# if releasing new version, make clear in news.md

# in terminal, run R CMD check --as-cran politicaldata_0.1.0.tar.gz and record any notes in cran-comments.md

# ok, now you can release
devtools::release()
