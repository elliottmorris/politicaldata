context("Getting Trump approval polls from FiveThirtyEightscores")
library(politicaldata)


# get_senate_nominate
test_that("trump_approval_polls_538() outputs non-empty dataset", {
  expect_is(trump_approval_polls_538(),class = "data.frame")
})
