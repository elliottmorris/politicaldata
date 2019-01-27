context("Getting House nominate scores")
library(politicaldata)


# get_house_nominate
test_that("get_house_nominate() outputs non-empty dataset", {
  expect_is(get_house_nominate(),class = "data.frame")
})
