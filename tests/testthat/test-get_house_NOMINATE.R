context("Getting House nominate scores")
library(politicaldata)


# get_house_NOMINATE
test_that("get_house_NOMINATE outputs non-empty dataset", {
  expect_is(get_house_NOMINATE(),class = "data.frame")
})
