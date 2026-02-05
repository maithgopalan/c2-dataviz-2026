---
title: 'Lab 5'
author: Maithreyi Gopalan
date: '2026-02-04'
assigned: '2026-02-04'
due: '2026-02-04'
slug: lab-5
categories:
  - Assignments
tags:
  - Labs
toc: true
---

## Overview
This lab focuses on refining visualizations for comparing categories through effective ordering, theme customization, and strategic annotations. You'll practice creating publication-ready visualizations that effectively communicate categorical comparisons. This is designed as an in-class 1-hour lab.

## Learning Objectives
By the end of this lab, you will be able to:
- Order categorical data to maximize clarity
- Apply and customize ggplot2 themes effectively
- Add meaningful annotations to guide reader attention
- Create compound figures using patchwork

## Required Packages
```r
library(tidyverse)
library(gapminder)
library(ggrepel)
library(gghighlight)
library(patchwork)
```

## Data
We'll be working with the **gapminder** dataset, focusing on countries in the Americas.

---

## Part 1: Ordering Categories Effectively

### Task 1.1
Using the `gapminder` dataset filtered to year 2007 and continent "Americas", create a dot plot showing GDP per capita by country.

Requirements:
- Filter to 2007 and Americas
- Order countries by GDP per capita (lowest to highest)
- Use `geom_point()` for a Cleveland dot plot
- Place country names on the y-axis
- Format GDP with `scales::dollar()`
- Add appropriate title and labels

**Hint**: Use `fct_reorder()` to order countries by GDP.

### Task 1.2
Convert your dot plot from Task 1.1 into a lollipop chart by adding line segments from 0 to each point.

Requirements:
- Use `geom_segment()` with gray lines
- Keep colored points from Task 1.1
- Maintain the same ordering and labels

**Question**: In 1-2 sentences, explain why ordering by value is more effective than alphabetical ordering for this visualization.

---

## Part 2: Theme Customization

### Task 2.1
Creat a plot showing life expectancy over time for countries in the Americas.

Requirements:
- Filter gapminder to Americas only
- Create line plot with `year` on x-axis and `lifeExp` on y-axis
- Use `geom_line()` with `aes(group = country)`
- Color all lines the same (your choice of color)
- Apply `theme_minimal()`
- Add title: "Life Expectancy in the Americas"

### Task 2.2
Customize the theme of your plot from Task 2.1 by modifying at least 5 theme elements.

Requirements must include:
1. Plot title (size, face, color)
2. Axis titles (size or face)
3. Panel grid (modify or remove major/minor)
4. Plot or panel background color
5. Legend position (if you add one)

Make intentional design choices that improve readability.

### Task 2.3
Create a custom theme function called `theme_yourname()` that encapsulates your customizations from Task 2.2.

Requirements:
- Include a `base_size` parameter with default = 14
- Include your 5+ theme customizations from Task 2.2
- Test it by applying to your plot

Example structure:
```r
theme_yourname <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
  theme(
    # Your customizations here
  )
}
```

---

## Part 3: Annotations

### Task 3.1
Using your Americas life expectancy plot from Task 2.1, add labels to identify specific countries using `gghighlight`.

Requirements:
- Highlight only countries with life expectancy > 75 years in 2007
- Use `gghighlight()` with `use_direct_label = TRUE`
- Keep your custom theme from Task 2.3

### Task 3.2
Create an alternative version using `ggforce::geom_mark_ellipse()` instead of gghighlight to highlight outliers.

Requirements:
- Start with the same base Americas plot
- Identify 2-3 countries with notably low life expectancy (you can see these on the lower part of the plot)
- Use `geom_mark_ellipse()` to draw an ellipse around these countries
- Add a description label to the ellipse

**Hint**: You'll need to filter the data to just those countries for `geom_mark_ellipse()`

**Question**: Which annotation method (Task 3.1 with gghighlight or Task 3.2 with geom_mark_ellipse) do you prefer for this data and why? Write 2-3 sentences.

---

## Part 4: Annotations with ggrepel

### Task 4.1
Create a scatter plot using gapminder data filtered to 2007 and Americas showing GDP per capita (x-axis, log scale) vs. life expectancy (y-axis).

Requirements:
- Filter to Americas and year 2007
- Use `geom_point()` with appropriate size
- Use `scale_x_log10(labels = scales::dollar)`
- Apply your custom theme

### Task 4.2
Add labels to the plot from Task 4.1 using `geom_text_repel()`.

Requirements:
- Label the 3 countries with highest GDP per capita
- Label the 3 countries with lowest life expectancy
- Use `geom_text_repel()` to avoid overlaps
- Differentiate these labeled countries with a different color or size

**Hint**: Create a variable to identify which countries should be labeled, then use that in your aesthetics and `geom_text_repel()`.

---

## Part 5: Compound Figures

### Task 5.1
Create two plots that tell a story about the Americas:
- **Plot A**: Your lollipop chart from Task 1.2 (GDP per capita in 2007)
- **Plot B**: Your annotated scatter plot from Task 4.2 (GDP vs. life expectancy)

Combine them using patchwork side-by-side.

Requirements:
- Use the `+` operator to place plots side by side
- Add an overall title using `plot_annotation()`
- Add tags (A, B) using `tag_levels`
- Ensure both plots use your custom theme

### Task 5.2
Experiment with the layout from Task 5.1.

Requirements:
- Try stacking the plots vertically using `/`
- Try making one plot larger than the other using `plot_layout(widths = c(2, 1))`

**Question**: Which layout (side-by-side, stacked, or different widths) works best for these two plots? Why?

---

## Part 6: Saving Your Work

### Task 6.1
Save your best compound figure from Part 5.

Requirements:
- Save as PNG with `ggsave()`
- Use 300 DPI
- Use dimensions: 10 inches wide by 6 inches tall
- Ensure white background with `bg = "white"`

Include the `ggsave()` code in your Rmd file.

---

## Reflection Questions (No need to write- we will discuss in class next week)

Answer the following (2-3 sentences each):

1. **Ordering**: When visualizing categorical data, what are two situations where you would NOT want to order by value?

2. **Themes**: How did creating a custom theme function help with consistency? What's one advantage of using a theme function vs. copying theme code?

3. **Annotations**: Compare direct labeling (like gghighlight) versus legends. What's one situation where you'd prefer each approach?

---

## Finishing Up
When you have finished the above, upload your rendered PDF file to Canvas.

## What to Submit
- A single PDF file rendered from your R Markdown
- Include all code, plots, and written answers
- Ensure plots are clearly visible and properly sized
