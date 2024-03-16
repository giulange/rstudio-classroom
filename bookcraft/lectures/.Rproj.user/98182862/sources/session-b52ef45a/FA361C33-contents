# Geospatial Data

## LINKS
how UTM Projection works: https://gisgeography.com/utm-universal-transverse-mercator-projection/ <br>
introduction to CRS and UTM : https://www.youtube.com/watch?v=HnWNhyxyUHg <br>
spatial data in R : https://edzer.github.io/UseR2017/ <br>

## Packages used
 - sp, sf for vector geospatial data
 - raster, terra for raster geospatial data

## Non-geographic data
Load the built in dataset called cars. R packages are often shipped with datasets to facilitate the exploitation of documentation.

```r
data(cars)
```

It is possible to get R documentation of datasets as long as of functions:

```r
?datasets::cars
```

Don't miss the opportunity to explore the content of the table \@ref(tab:tab-cars).

Table: (\#tab:tab-cars)Here is a preview of the cars data frame

| speed| dist|
|-----:|----:|
|     4|    2|
|     4|   10|
|     7|    4|
|     7|   22|
|     8|   16|
|     9|   10|
|    10|   18|
|    10|   26|
|    10|   34|
|    11|   17|

Anytime a new R object is created in the enviroment, it is advisable to explore its content. First step, get the class of the cars dataset:

```r
class(cars)
#> [1] "data.frame"
```

Let's give a look to the object size...

```r
dim(cars)
#> [1] 50  2
```

...to the variables included in the cars data frame...

```r
names(cars)
#> [1] "speed" "dist"
```

...and to their statistics:

```r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

See Figure \@ref(fig:cars-df).


```r
require(stats)
require(graphics)
plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)", las = 1)
lines(lowess(cars$speed, cars$dist, f = 2/3, iter = 3), col = "red")
title(main = "cars data")
```

<div class="figure" style="text-align: center">
<img src="02-geospatial-data_files/figure-html/cars-df-1.png" alt="This is a figure created using the examples provided in documentation." width="80%" />
<p class="caption">(\#fig:cars-df)This is a figure created using the examples provided in documentation.</p>
</div>


It is possible to get detailed information also on the class and data types for variables included in data frames. Indeed, compare the result for the data frame object _cars_

```r
class(cars)
#> [1] "data.frame"
typeof(cars)
#> [1] "list"
```

...for the _dist_ variable:

```r
class(cars$dist)
#> [1] "numeric"
typeof(cars$dist)
#> [1] "double"
```
...and for the _speed_ variable::

```r
class(cars$speed)
#> [1] "numeric"
typeof(cars$speed)
#> [1] "double"
```

The same result can be obtained extracting the variable of interest first:

```r
s = cars$speed
class(s)
#> [1] "numeric"
typeof(s)
#> [1] "double"
head(s)
#> [1] 4 4 7 7 8 9
```

The cars dataset offers a simple example of non-geographic information. Now let's start the study of geographic or geospatial data.

According to the lecture on GIS & Cartography, which characteristics and variables do you expect to manage a geospatial data?


## Spatial data have spatial reference
 - coordinate values (e.g. XY, XYZ)
 - a system of reference for these coordinates (e.g. WGS84)

All spatial data consist of <b>positional information</b>, answering the question <i>‘where is it?’</i>.<br>
In many applications these will be extended by <b>attributes</b>, answering the question <i>‘what is where?’</i>

## Spatial data models
<ul>
    <p style="text-decoration:underline;"><font size=4 color="magenta">Vector data models</font></p>
    <li><b>Point</b>: a single point location, such as a GPS reading or a geocoded address</li>
    <li><b>Line</b>: a set of ordered points, connected by straight line segments</li>
    <li><b>Polygon</b>: an area, marked by one or more enclosing lines, possibly containing holes, with no lines intersecting</li>
    <p style="text-decoration:underline;"><font size=4 color="magenta">Raster data model</font></p>
    <li><b>Grid</b>: a collection of points or rectangular cells, organised in a regular lattice</li>
</ul>

### Vector vs Raster data models
I have to put here all the information available at `/home/giuliano/artwork/raster_vs_vector/`.


