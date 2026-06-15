# Trees & Tibble-ations

Welcome to Trees & Tibble-ations on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

In other parts of the syllabus, we have seen various data types with different characteristics.

- Atomic vectors are 1-dimensional and homogenous in type.
- Lists are 1-dimensional and elements can be of heterogenous types.
- Matrices and arrays are multi-dimensional and homogeneous.

This Concept will look at ways to store multi-dimensional, heterogenous data.
In practice, _most_ real-world data is like this, so we are now getting to the heart of how R is (mostly) used in practice.

## Dataframe variants

Over the decades, R has added multiple data types to handle tabular data.

This syllabus will focus mainly on tibbles, but it is useful to know about alternatives.

### The `data.frame`

In Base R, a `data.frame` is a `list` of equal-length `vectors`.
This can be thought of as a rectangular table of data, in which each column is homogeneous, but each row can (and usually does) contain different types of data.

An example to illustrate this:

```R
# create the column vectors
languages <- c("Fortran", "R", "Python", "Julia")
created <- c(1957, 1993, 1991, 2012)
has.syllabus <- c(FALSE, TRUE, TRUE, TRUE)

# join columns to create the dataframe
df <- data.frame(languages, created, has.syllabus)
df
#>   languages created has.syllabus
#> 1   Fortran    1957        FALSE
#> 2         R    1993         TRUE
#> 3    Python    1991         TRUE
#> 4     Julia    2012         TRUE
 ```

 We have a column of character strings, a column of numbers and a column of booleans.
 When scaled up, this is an intuitive way to represent many collections of real world data.

### The `tibble`

The `data.frame` design is _old_.

Multi-decade experience, plus changing patterns of how R is used, led to a redesign, creating a modernized alternative in the Tidyverse: tibbles.

Compared to Base R, tibbles have:

- Different defaults, to reduce common problems.
- Less willingness to coerce data types during input.
- More and clearer error messages.
- Different, usually better, display formats.

In short, a `tibble` aims to "_do less and complain more_", also described as "_lazy and surly_".

The types are usually interchangeable: any function which accepts a `data.frame` will also accept a `tibble`, and _vice versa_.

Conversions between the types are easy, with `as_tibble(df)` and `as.data.frame(tbl)`.

For new work, using tibbles will probably help you create more robust code.
However, legacy code and legacy data is very plentiful in the R world, so the `data.frame` is likely to remain common for a long time.

```R
# column vectors are same as for data.frame
library(tibble)
tbl <- tibble(languages, created, has.syllabus)
tbl
  # A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE      
```

Note the default print format: the comment line with dimensions is printed automatically, and column types are also displayed.

## Working with tibbles

Tibbles are a core part of the Tidyverse, so add them with either `library(tibble)` or `library(tidyverse)`.

### Creating a tibble

Most simply, we can use the `tibble()` function to join column vectors, as for `data.frame()`.
An example of this was shown in a previous section.

If it is more convenient to enter values row-wise, the corresponding function is `tribble()`.

In practice, there are dozens of ways to create tibbles, as they are the default output format from a diverse range of Tidyverse functions.

## Manipulating a tibble

The Functional Programming Concept discussed the `purrr` library to manipulate vectors and lists (1-D data structures).

For dataframes (whether traditional or tibbles), the corresponding library to use is `dplyr`.

### Subsetting

Dataframes, including tibbles, can be treated as lists of column vectors, so list indexing recovers a specified column.

```R
tbl
# A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE    

tbl$created
#> [1] 1957 1993 1991 2012
```

A dataframe can also be indexed with matrix-style indexing.

```R
tbl[c(2, 4), 1:2]
  # A tibble: 2 × 2
#>   languages created
#>   <chr>       <dbl>
#> 1 R            1993
#> 2 Julia        2012
```

In modern R with the Tidyverse ecosystem, `dplyr` functions are generally more flexible and convenient, and will be the focus for the rest of this Concept.

### Column-wise operations

Get a single column with `pull()` with the name or sequential number (negative numbers to count right-to-left).

```R
tbl |> pull(created)
#> [1] 1957 1993 1991 2012
```

This is the same result as `tbl$created`, but using a pipeline-friendly function.

To get multiple columns, the appropriate function is `select()`, which is highly versatile.
Get (or drop) columns based on properties of their name or type.

```R
# Range with position and/or name
tbl |> select(1:created)
  # A tibble: 4 × 2
#>   languages created
#>   <chr>       <dbl>
#> 1 Fortran      1957
#> 2 R            1993
#> 3 Python       1991
#> 4 Julia        2012      

# Use type of column
tbl |> select(where(is.numeric))
  # A tibble: 4 × 1
#>   created
#>     <dbl>
#> 1    1957
#> 2    1993
#> 3    1991
#> 4    2012
```

Multiple criteria are allowed, using Boolean operators `&`, `|` and `!` (and, or not).

Such power seems quite silly with our toy dataframe of languages.
Fortunately, the `starwars` tibble is included in `dplyr`, giving us something bigger to practice with.

```R
# pick a subset of columns
starwars |> 
  select(name | ends_with("color")) |> 
  head(5)
  # A tibble: 5 × 4
#>   name           hair_color skin_color  eye_color
#>   <chr>          <chr>      <chr>       <chr>    
#> 1 Luke Skywalker blond      fair        blue     
#> 2 C-3PO          NA         gold        yellow   
#> 3 R2-D2          NA         white, blue red      
#> 4 Darth Vader    none       white       yellow   
#> 5 Leia Organa    brown      light       brown    
```

### Row-wise operations

Get rows matching some criteria with `filter()`, or exclude them with `filter_out()`.

```R
starwars |> 
  select(name:mass) |> 
  filter(between(height, 150, 165) & !is.na(mass))
  # A tibble: 4 × 3
#>   name               height  mass
#>   <chr>               <int> <dbl>
#> 1 Leia Organa           150    49
#> 2 Beru Whitesun Lars    165    75
#> 3 Nien Nunb             160    68
#> 4 Ben Quadinaros        163    65
```

Filter criteria can be arbitrarily complex, but always based on row _contents_.

If row _numbers_ are known, we can use a variety of `slice()` functions.

```R
starwars |> 
  select(name | homeworld) |> 
  slice(20:25)
  # A tibble: 6 × 2
#>   name             homeworld
#>   <chr>            <chr>    
#> 1 Palpatine        Naboo    
#> 2 Boba Fett        Kamino   
#> 3 IG-88            NA       
#> 4 Bossk            Trandosha
#> 5 Lando Calrissian Socorro  
#> 6 Lobot            Bespin   
```

## Modifying a tibble

First caveat: the _copy-on-modify_ default means that the original tibble usually remains unchanged.

Most modifications are applied column-wise.

Column names can be changed with `rename(newname = oldname)`, or `rename_with()` to apply a function.
Note the syntax within `rename()`.
The _contents_ of column `oldname` are _bound_ to name `newname`, hence the order.

Column order can be changed with `relocate()`.
Specified column(s) are moved to the left-most position(s) by default, but a `.before` or `.after` argument can be used for finer positioning.

```R
sw <- starwars |> select(name:species) |> slice(1:4)
sw
  # A tibble: 4 × 11
#>   name           height  mass hair_color skin_color  eye_color birth_year sex   gender    homeworld species
#>   <chr>           <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>     <chr>     <chr>  
#> 1 Luke Skywalker    172    77 blond      fair        blue            19   male  masculine Tatooine  Human  
#> 2 C-3PO             167    75 NA         gold        yellow         112   none  masculine Tatooine  Droid  
#> 3 R2-D2              96    32 NA         white, blue red             33   none  masculine Naboo     Droid  
#> 4 Darth Vader       202   136 none       white       yellow          41.9 male  masculine Tatooine  Human  

sw |> relocate(c(species, homeworld), .after = name)
  # A tibble: 4 × 11
#>   name           species homeworld height  mass hair_color skin_color  eye_color birth_year sex   gender   
#>   <chr>          <chr>   <chr>      <int> <dbl> <chr>      <chr>       <chr>          <dbl> <chr> <chr>    
#> 1 Luke Skywalker Human   Tatooine     172    77 blond      fair        blue            19   male  masculine
#> 2 C-3PO          Droid   Tatooine     167    75 NA         gold        yellow         112   none  masculine
#> 3 R2-D2          Droid   Naboo         96    32 NA         white, blue red             33   none  masculine
#> 4 Darth Vader    Human   Tatooine     202   136 none       white       yellow          41.9 male  masculine
```

For bigger changes, `mutate()` lets you:

- Create new columns that are functions of existing columns.
- Replace an existing column, by creating a new column with the same name.
- Delete a column, by setting its value to `NULL`.

Clearly, `mutate()` is powerful, potentially confusing, and a reason to be very grateful for copy-on-modify.

There is no obvious reason to care about the Body Mass Index of Star Wars characters, but just in case:

```R
starwars |> 
  select(c(name, species, height, mass)) |> 
  mutate(BMI = mass / (height / 100)^2) |> 
  head(4)
  # A tibble: 4 × 5
#>   name           species height  mass   BMI
#>   <chr>          <chr>    <int> <dbl> <dbl>
#> 1 Luke Skywalker Human      172    77  26.0
#> 2 C-3PO          Droid      167    75  26.9
#> 3 R2-D2          Droid       96    32  34.7
#> 4 Darth Vader    Human      202   136  33.3
```

**Row-wise operations** are less common for modifying single tibbles (merging multiple tibbles will be discussed in a later concept).

One exception: `arrange()` sorts rows by the values in one or more columns.

```R
tbl
#>       A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 R            1993 TRUE        
#> 3 Python       1991 TRUE        
#> 4 Julia        2012 TRUE  

tbl |> arrange(languages)
#>       A tibble: 4 × 3
#>   languages created has.syllabus
#>   <chr>       <dbl> <lgl>       
#> 1 Fortran      1957 FALSE       
#> 2 Julia        2012 TRUE        
#> 3 Python       1991 TRUE        
#> 4 R            1993 TRUE     
```

## Instructions

A large cherry orchard generally has a small inventory of surplus trees which they would like to offer as lumber.
This helps keep the orchard healthy while providing extra revenue at the same time.
They have asked you to help code up some functionality to help in the tree selection process when a potential customer calls.

~~~~exercism/note
The built-in [`datasets`][ref-datasets] library has many toy datasets, and this exercise uses the `trees` dataset.
To call the dataset, simply use the name `trees`.
```R
library(datasets) # loading is optional

trees |> head(3)
#>    A data.frame: 3 × 3 	
#>   Girth	Height	Volume
#>	 <dbl>	 <dbl>	 <dbl>
#> 1   8.3	    70	  10.3  
#> 2   8.6	    65	  10.3
#> 3   8.8	    63	  10.2
```
Please note the three columns: `Girth`, `Height` and `Volume`

The dataset is initially in the form of a `data.frame`, but you may want to choose to work with it as a `tibble`.

[ref-datasets]: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
~~~~

## 1. Rename a column

Unfortunately there was a clerical error which has never been fixed and one column in the dataset is named `Girth`, but this is really the `Diameter`.

Define a data.frame/tibble called `tree_data` that corrects the name of the `Girth` column in `trees` to `Diameter`.

```R
head(tree_data, 3)
#>     A tibble: 3 × 3 
#> Diameter	 Height	Volume
#>    <dbl>	  <dbl>	 <dbl>
#>      8.3	     70	  10.3
#>      8.6	     65	  10.3
#>      8.8	     63	  10.2
```

## 2. Add girth and weight columns

The girth (aka circumference) is still a useful measurement, and so is the weight of the timber.
The girth is easily calculated by `πD`, where `D` is the diameter.
The weight of all the timber can be calculate by `ρV`, where `ρ = 35` is the density of cherry wood and `V` is the volume of timber.

Define the function `girth_n_weight(data, rnd_digits)` which takes dataframe and numeric arguments.
The function should return a new dataframe with the two additional columns: `Girth` and `Weight` rounded to the appropriate number of digits given by `rnd_digits`.

```R
girth_n_weight(tree_data, 1) |> head(3)
#>           A tibble: 3 × 5 
#> Diameter  Height	 Volume	 Girth	Weight
#>    <dbl>	  <dbl>	  <dbl>	 <dbl>	 <dbl>
#>      8.3	     70	   10.3	  26.1	 360.5
#>      8.6	     65	   10.3	  27.0	 360.5
#>      8.8	     63	   10.2	  27.6	 357.0
```

## 3. Orchard copy of dataset

For each potential customer, the orchard keeps a special copy of the dataset to help with the sale.
This dataset has the most relevant columns, `Weight` and `Height`, moved to the front and is sorted by `Weight`.

Define the function `orchard_copy(data, important_cols)` which takes a dataframe as input.
This should return a new dataframe with `Weight` and `Height` moved to the front and the rows sorted by `Weight`.

```R
tree_data |> girth_n_weight() |> orchard_copy() |> head(3)
#>            A tibble: 3 × 5 
#> Weight	Height	Diameter	Volume	Girth
#>  <dbl>	 <dbl>	   <dbl>	 <dbl>	<dbl>
#>    357	    63	       9	    10	   28
#>    360	    70	       8	    10	   26
#>    360	    65	       9	    10	   27
```

## 4. Customer copy of dataset

Each potential customer will get a personal version of the dataset based on their preferences.
To this end, the customer may specify: the minimum height, the maximum height and the maximum weight of any single tree.

Define the `customer_copy(data, min_height, max_height, max_weight)` function.
Return a customer copy of the dataframe with `Height`, `Weight`, `Diameter` and `Girth` columns with rows that are within the constraints.

```R
tree_data |> 
    girth_n_weight(1) |> 
    orchard_copy() |>
    customer_copy(65, 75, 1500) |> 
    head(3)
#>        A tibble: 3 × 4 
#> Height	Weight	Diameter	Girth
#>  <dbl>	 <dbl>	   <dbl>	<dbl>
#>     70	 360.5	     8.3	 26.1
#>     65	 360.5	     8.6	 27.0
#>     66	 546.0	    11.0	 34.6
```

## Source

### Created by

- @depial