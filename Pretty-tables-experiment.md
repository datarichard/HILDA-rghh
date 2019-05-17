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
starwars
```

    ## # A tibble: 87 x 13
    ##    name  height  mass hair_color skin_color eye_color birth_year gender
    ##    <chr>  <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> 
    ##  1 Luke…    172    77 blond      fair       blue            19   male  
    ##  2 C-3PO    167    75 <NA>       gold       yellow         112   <NA>  
    ##  3 R2-D2     96    32 <NA>       white, bl… red             33   <NA>  
    ##  4 Dart…    202   136 none       white      yellow          41.9 male  
    ##  5 Leia…    150    49 brown      light      brown           19   female
    ##  6 Owen…    178   120 brown, gr… light      blue            52   male  
    ##  7 Beru…    165    75 brown      light      blue            47   female
    ##  8 R5-D4     97    32 <NA>       white, red red             NA   <NA>  
    ##  9 Bigg…    183    84 black      light      brown           24   male  
    ## 10 Obi-…    182    77 auburn, w… fair       blue-gray       57   male  
    ## # … with 77 more rows, and 5 more variables: homeworld <chr>,
    ## #   species <chr>, films <list>, vehicles <list>, starships <list>

The `starwars` dataframe is a long (77 rows) and wide (13 columns)
table, so it won’t fit on the markdown page and we definitely don’t want
to print all of it. However it also is printing as code-text rather than
as a nice table.

Let’s see if adding `kable()` helps:

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

Kable prints nicer tables, but the row height is poorly adjusted in the
example above. That may be due to the amount of text in the `films`
column. Let’s omit it in future tests.

Kable also provides a format argument. There are five options: `latex`,
`markdown`, `html`, `pandoc` and `rst`. It is automatically set but
providing the argument should override that. Let’s try markdown:

``` r
head(starwars) %>%
  select(name:species) %>%
  kable(format = "markdown", caption = "markdown")
```

| name           | height | mass | hair\_color | skin\_color | eye\_color | birth\_year | gender | homeworld | species |
| :------------- | -----: | ---: | :---------- | :---------- | :--------- | ----------: | :----- | :-------- | :------ |
| Luke Skywalker |    172 |   77 | blond       | fair        | blue       |        19.0 | male   | Tatooine  | Human   |
| C-3PO          |    167 |   75 | NA          | gold        | yellow     |       112.0 | NA     | Tatooine  | Droid   |
| R2-D2          |     96 |   32 | NA          | white, blue | red        |        33.0 | NA     | Naboo     | Droid   |
| Darth Vader    |    202 |  136 | none        | white       | yellow     |        41.9 | male   | Tatooine  | Human   |
| Leia Organa    |    150 |   49 | brown       | light       | brown      |        19.0 | female | Alderaan  | Human   |
| Owen Lars      |    178 |  120 | brown, grey | light       | blue       |        52.0 | male   | Tatooine  | Human   |

-----

Testing html:

``` r
head(starwars) %>%
  select(name:species) %>%
  kable(format = "html", caption = "html")
```

<table>

<caption>

html

</caption>

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

</tr>

</tbody>

</table>

-----

Testing pandoc:

``` r
head(starwars) %>%
  select(name:species) %>%
  kable(format = "pandoc", caption = "pandoc")
```

| name           | height | mass | hair\_color | skin\_color | eye\_color | birth\_year | gender | homeworld | species |
| :------------- | -----: | ---: | :---------- | :---------- | :--------- | ----------: | :----- | :-------- | :------ |
| Luke Skywalker |    172 |   77 | blond       | fair        | blue       |        19.0 | male   | Tatooine  | Human   |
| C-3PO          |    167 |   75 | NA          | gold        | yellow     |       112.0 | NA     | Tatooine  | Droid   |
| R2-D2          |     96 |   32 | NA          | white, blue | red        |        33.0 | NA     | Naboo     | Droid   |
| Darth Vader    |    202 |  136 | none        | white       | yellow     |        41.9 | male   | Tatooine  | Human   |
| Leia Organa    |    150 |   49 | brown       | light       | brown      |        19.0 | female | Alderaan  | Human   |
| Owen Lars      |    178 |  120 | brown, grey | light       | blue       |        52.0 | male   | Tatooine  | Human   |

pandoc

-----

Testing latex:

``` r
head(starwars) %>%
  select(name:species) %>%
  kable(format = "latex", caption = "latex")
```

-----

Testing rst:

``` r
head(starwars) %>%
  select(name:species) %>%
  kable(format = "rst", caption = "rst")
```

\============== ====== ==== =========== =========== ========= ==========
====== ========= ======= name height mass hair\_color skin\_color
eye\_color birth\_year gender homeworld species ============== ======
==== =========== =========== ========= ========== ====== =========
======= Luke Skywalker 172 77 blond fair blue 19.0 male Tatooine Human  
C-3PO 167 75 NA gold yellow 112.0 NA Tatooine Droid  
R2-D2 96 32 NA white, blue red 33.0 NA Naboo Droid  
Darth Vader 202 136 none white yellow 41.9 male Tatooine Human  
Leia Organa 150 49 brown light brown 19.0 female Alderaan Human  
Owen Lars 178 120 brown, grey light blue 52.0 male Tatooine Human  
\============== ====== ==== =========== =========== ========= ==========
====== ========= =======
