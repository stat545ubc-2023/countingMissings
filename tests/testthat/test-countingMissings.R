small_tbl <- dplyr::tribble(~group, ~var1, ~var2,
                            "A", 1, NA,
                            "A", 2, "x",
                            "B", NA, "y",
                            "C", 3, "z")

test_that("Output matches direct call to dplyr", {
  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
                            .groups = "drop"),
                count_all_missing_by_group(small_tbl, group)
  )

  expect_equal( small_tbl |> dplyr::group_by(group) |>
                  dplyr::summarize(dplyr::across(dplyr::everything(), ~sum(is.na(.x))),
                            .groups = NULL),
                count_all_missing_by_group(small_tbl, group, NULL)
  )
})

test_that("Checking error handling for .groups input", {
  expect_error(
    count_all_missing_by_group(airquality, Month, "kep")
  )
  expect_no_error(
    count_all_missing_by_group(airquality, Month, NULL)
  )
})
