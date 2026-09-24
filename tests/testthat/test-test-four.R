library(testthat)
lin611runtest::makesource(here::here("assignment.qmd"))
source(here::here("tests", "r", "assignment.R"))

test_that("assignment", {
  expect_equal(four, 4)
})

