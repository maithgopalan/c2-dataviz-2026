---
title: 'Lab 4: Effective Use of Color'
author: Maithreyi Gopalan
date: '2025-01-06'
assigned: '2026-01-28'
due: '2026-02-04'
slug: lab-4
categories:
  - Assignments
tags:
  - Labs
toc: true
---

## Overview
The purpose of this lab is to help you master the strategic use of color in data visualization. You will work with color for its three main purposes covered in lecture: 
(a) **distinguish groups** from each other, (b) **represent data values**, and (c) **highlight** particular data points.

This lab directly applies the color packages and resources introduced in the Week 4 lecture slides, including viridis, RColorBrewer, colorspace, and accessibility testing with colorblindr.

## Data
We'll be working with the Palmer Penguins dataset, a modern alternative to the iris dataset. You can load it directly from the **palmerpenguins** package:

```r
library(palmerpenguins)
data(penguins)
```

The dataset includes measurements for three penguin species (Adelie, Chinstrap, Gentoo) across three islands, with variables for bill dimensions, flipper length, body mass, and sex.

## Packages
You'll need these packages (install any you don't have):

```r
library(tidyverse)
library(palmerpenguins)
library(viridis)
library(RColorBrewer)
library(colorspace)
library(ggrepel)

# Optional but recommended:
# library(colorblindr)  # remotes::install_github("clauswilke/colorblindr")
# library(gghighlight)
```

## Lab Tasks

### Part 1: Distinguishing Groups (Qualitative Color)

**1.1** Create a scatterplot showing bill length vs. bill depth, colored by species. Compare at least three different qualitative palettes:
   - ColorBrewer (use `scale_color_brewer(palette = "Set2")`)
   - Viridis discrete (use `scale_color_viridis_d(option = "plasma")`)
   - Okabe-Ito colors (manually specify or use `scale_color_OkabeIto()`)

**Reflection:** Which palette works best for distinguishing the three species? Why?

**1.2** Create a boxplot of body mass by island. Use a colorblind-safe palette from ColorBrewer.
   + **Hint:** Check which palettes are colorblind-friendly with `RColorBrewer::display.brewer.all(colorblindFriendly = TRUE)`
   + If you have `colorblindr`, test your plot with `cvd_grid(your_plot)`

---

### Part 2: Representing Data Values (Sequential & Diverging)

**2.1** Create a scatterplot of flipper length vs. body mass, with points colored by bill length (continuous). Try three sequential palettes:
   - Viridis continuous: `scale_color_viridis_c(option = "inferno")`
   - ColorBrewer: `scale_color_distiller(palette = "YlOrRd")`
   - Colorspace: `scale_color_continuous_sequential(palette = "Heat")`

**Reflection:** Which palette makes it easiest to perceive differences in bill length?

**2.2** Calculate mean body mass by species and sex. Create a heatmap using `geom_tile()` with a diverging color scale.
   + Use `scale_fill_distiller(palette = "RdBu", direction = -1)`
   + Add text labels with `geom_text()` showing the actual values
   + **Hint:** You'll need to wrangle the data first:
```r
penguin_summary <- penguins %>%
  drop_na(sex) %>%
  group_by(species, sex) %>%
  summarize(mean_mass = mean(body_mass_g), .groups = "drop")
```

---

### Part 3: Highlighting Specific Points

**3.1** Create a scatterplot of flipper length vs. bill length. Highlight only Gentoo penguins in a bright color; show all others in gray.
   + **Approach 1:** Create a highlighting variable and use `scale_color_manual()`
   + **Approach 2:** Use the `gghighlight` package if available
   + **Reflection:** Which approach gives you more control?

**3.2** Create a line plot showing penguin counts by year and species. Highlight only Adelie penguins while keeping other species visible in gray.
   + **Hint:** First create summary data with `count(year, species)`
   + Use layering: gray background layer + colored highlight layer

---

### Part 4: Accessibility Check

**4.1** Take one of your plots from Part 1 or 2 and test it for colorblind accessibility.
   - If you have `colorblindr`: use `cvd_grid(your_plot)` to simulate different types
   - Otherwise: visit https://www.color-blindness.com/coblis-color-blindness-simulator/
   - If your plot isn't accessible, revise it with a colorblind-safe palette

**4.2** Demonstrate double encoding by creating a scatterplot that uses both color AND shape to distinguish groups.
   + Example: `aes(x = bill_length_mm, y = body_mass_g, color = island, shape = island)`
   + **Reflection:** How does adding shape improve accessibility?

---

### Part 5: Avoiding Common Problems

**5.1** Create an example showing the "too many colors" problem, then fix it using selective highlighting and labels with `geom_text_repel()`.
   + **Hint:** Identify a few interesting points (extreme values) to highlight instead of coloring everything

**5.2** Create a bar chart of penguin counts by species using:
   - A rainbow palette (to demonstrate why it's problematic)
   - A proper qualitative palette (to show the better approach)
   + If you have `colorblindr`, compare both under colorblind simulation

---

## Finishing Up

When you have finished the above:

1. **Knit your document** to PDF
2. **Review your work** - Do your color choices communicate effectively?
3. **Include brief reflections** where requested
4. **Upload to Canvas**

### Key Principles to Remember

- Match palette type to data type (qualitative, sequential, or diverging)
- Always consider colorblindness when choosing colors
- Use color strategically—highlight only what matters
- Avoid rainbow palettes for categorical data
- Test accessibility with colorblindr when possible
- Less is more: limit categorical colors to 5-8 maximum

---

## Resources

Refer to Week 4 lecture slides for:
- Color package documentation and examples
- Links to ColorBrewer 2.0, viridis vignettes, and colorspace articles
- Accessibility guidelines and testing tools
- Common pitfalls and solutions

**Recommended readings:**
- [Fundamentals of Data Visualization, Chapter 4](https://clauswilke.com/dataviz/color-basics.html)
- [ggplot2 book, Chapter 12](https://ggplot2-book.org/scales-colour)
- [Your Friendly Guide to Colors in Data Viz](https://blog.datawrapper.de/colorguide/)
