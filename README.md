
<!-- README.md is generated from README.Rmd. Please edit that file -->

# countingMissings

<!-- badges: start -->
<!-- badges: end -->

This package contains a function to count missing values for all columns
by group. By passing the data frame or tibble and columns to group by,
this function will return a data frame or tibble with the number of NAs
in each group specified in parameters. You can also pass the optional
parameter “.group” to specify whether to keep the output data frame
grouped by groups.

The dependency is the dplyr library.

## Installation

You can install the development version of countingMissings from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/countingMissings")
```

## Example

This example computes the number of missing values in the `airquality`
dataset grouped by the `cyl` column.

``` r
library(countingMissings)
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

This example has the same output as the last example, but shows off an
alternative way of invoking the `count_all_missing_by_group()`: piping
the dataset into the function.

``` r
airquality |> count_all_missing_by_group(Month) 
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

The optional `.groups` argument allows us to keep the output grouped by
the grouping column. See example below; notice how the output is a
grouped tibble, rather than the ungrouped tibble output of the earlier
examples.

    #> # A tibble: 5 × 6
    #> # Groups:   Month [5]
    #>   Month Ozone Solar.R  Wind  Temp   Day
    #>   <int> <int>   <int> <int> <int> <int>
    #> 1     5     5       4     0     0     0
    #> 2     6    21       0     0     0     0
    #> 3     7     5       0     0     0     0
    #> 4     8     5       3     0     0     0
    #> 5     9     1       0     0     0     0
