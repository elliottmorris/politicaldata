context("Getting Senate nominate scores")
library(politicaldata)


# get_senate_nominate
test_that("get_senate_nominate() outputs non-empty dataset", {
  expect_is(get_senate_nominate(116),class = "data.frame")
})
