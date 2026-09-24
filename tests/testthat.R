# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
lin611runtest::makesource(here::here("assignment.qmd"))

readr::read_lines(here::here("tests", "R", "assignment.R")) |> 
  stringr::str_replace(
    "install.packages\\((.+)\\)",
    "if\\(!require\\( \\1 \\)\\)\\{install.packages\\( \\1 \\)\\}"
  ) |> 
  stringr::str_replace(
    "print\\(.+\\)",
    ""
  ) |> 
  readr::write_lines(here::here("tests", "R", "assignment.R"))

testthat::test_dir(here::here("tests", "testthat"))
