Pretty tables experiment
================
Richard Morris
17/05/2019

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. It also authors markdown
documents which can be rendered on GitHub.

GitHub is very useful for sharing documents and results. However much of
my work involves tabulating data and for some reason GitHub does not
render tables very well in jupyter notebooks. So this experiment is to
see how GitHub handles tables produced in an markdown document.

Let’s begin by trying a basic table:

``` r
head(starwars)
```

    ## # A tibble: 6 x 13
    ##   name  height  mass hair_color skin_color eye_color birth_year gender
    ##   <chr>  <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> 
    ## 1 Luke…    172    77 blond      fair       blue            19   male  
    ## 2 C-3PO    167    75 <NA>       gold       yellow         112   <NA>  
    ## 3 R2-D2     96    32 <NA>       white, bl… red             33   <NA>  
    ## 4 Dart…    202   136 none       white      yellow          41.9 male  
    ## 5 Leia…    150    49 brown      light      brown           19   female
    ## 6 Owen…    178   120 brown, gr… light      blue            52   male  
    ## # … with 5 more variables: homeworld <chr>, species <chr>, films <list>,
    ## #   vehicles <list>, starships <list>

Adding kable might help:

``` r
head(starwars) %>%
  kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

name

</th>

<th style="text-align:right;">

height

</th>

<th style="text-align:right;">

mass

</th>

<th style="text-align:left;">

hair\_color

</th>

<th style="text-align:left;">

skin\_color

</th>

<th style="text-align:left;">

eye\_color

</th>

<th style="text-align:right;">

birth\_year

</th>

<th style="text-align:left;">

gender

</th>

<th style="text-align:left;">

homeworld

</th>

<th style="text-align:left;">

species

</th>

<th style="text-align:left;">

films

</th>

<th style="text-align:left;">

vehicles

</th>

<th style="text-align:left;">

starships

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Luke Skywalker

</td>

<td style="text-align:right;">

172

</td>

<td style="text-align:right;">

77

</td>

<td style="text-align:left;">

blond

</td>

<td style="text-align:left;">

fair

</td>

<td style="text-align:left;">

blue

</td>

<td style="text-align:right;">

19.0

</td>

<td style="text-align:left;">

male

</td>

<td style="text-align:left;">

Tatooine

</td>

<td style="text-align:left;">

Human

</td>

<td style="text-align:left;">

c(“Revenge of the Sith”, “Return of the Jedi”, “The Empire Strikes
Back”, “A New Hope”, “The Force Awakens”)

</td>

<td style="text-align:left;">

c(“Snowspeeder”, “Imperial Speeder Bike”)

</td>

<td style="text-align:left;">

c(“X-wing”, “Imperial shuttle”)

</td>

</tr>

<tr>

<td style="text-align:left;">

C-3PO

</td>

<td style="text-align:right;">

167

</td>

<td style="text-align:right;">

75

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

gold

</td>

<td style="text-align:left;">

yellow

</td>

<td style="text-align:right;">

112.0

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

Tatooine

</td>

<td style="text-align:left;">

Droid

</td>

<td style="text-align:left;">

c(“Attack of the Clones”, “The Phantom Menace”, “Revenge of the Sith”,
“Return of the Jedi”, “The Empire Strikes Back”, “A New Hope”)

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

character(0)

</td>

</tr>

<tr>

<td style="text-align:left;">

R2-D2

</td>

<td style="text-align:right;">

96

</td>

<td style="text-align:right;">

32

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

white, blue

</td>

<td style="text-align:left;">

red

</td>

<td style="text-align:right;">

33.0

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

Naboo

</td>

<td style="text-align:left;">

Droid

</td>

<td style="text-align:left;">

c(“Attack of the Clones”, “The Phantom Menace”, “Revenge of the Sith”,
“Return of the Jedi”, “The Empire Strikes Back”, “A New Hope”, “The
Force Awakens”)

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

character(0)

</td>

</tr>

<tr>

<td style="text-align:left;">

Darth Vader

</td>

<td style="text-align:right;">

202

</td>

<td style="text-align:right;">

136

</td>

<td style="text-align:left;">

none

</td>

<td style="text-align:left;">

white

</td>

<td style="text-align:left;">

yellow

</td>

<td style="text-align:right;">

41.9

</td>

<td style="text-align:left;">

male

</td>

<td style="text-align:left;">

Tatooine

</td>

<td style="text-align:left;">

Human

</td>

<td style="text-align:left;">

c(“Revenge of the Sith”, “Return of the Jedi”, “The Empire Strikes
Back”, “A New Hope”)

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

TIE Advanced x1

</td>

</tr>

<tr>

<td style="text-align:left;">

Leia Organa

</td>

<td style="text-align:right;">

150

</td>

<td style="text-align:right;">

49

</td>

<td style="text-align:left;">

brown

</td>

<td style="text-align:left;">

light

</td>

<td style="text-align:left;">

brown

</td>

<td style="text-align:right;">

19.0

</td>

<td style="text-align:left;">

female

</td>

<td style="text-align:left;">

Alderaan

</td>

<td style="text-align:left;">

Human

</td>

<td style="text-align:left;">

c(“Revenge of the Sith”, “Return of the Jedi”, “The Empire Strikes
Back”, “A New Hope”, “The Force Awakens”)

</td>

<td style="text-align:left;">

Imperial Speeder Bike

</td>

<td style="text-align:left;">

character(0)

</td>

</tr>

<tr>

<td style="text-align:left;">

Owen Lars

</td>

<td style="text-align:right;">

178

</td>

<td style="text-align:right;">

120

</td>

<td style="text-align:left;">

brown, grey

</td>

<td style="text-align:left;">

light

</td>

<td style="text-align:left;">

blue

</td>

<td style="text-align:right;">

52.0

</td>

<td style="text-align:left;">

male

</td>

<td style="text-align:left;">

Tatooine

</td>

<td style="text-align:left;">

Human

</td>

<td style="text-align:left;">

c(“Attack of the Clones”, “Revenge of the Sith”, “A New Hope”)

</td>

<td style="text-align:left;">

character(0)

</td>

<td style="text-align:left;">

character(0)

</td>

</tr>

</tbody>

</table>
