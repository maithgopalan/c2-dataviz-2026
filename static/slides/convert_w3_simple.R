library(here)
library(rmarkdown)
library(pagedown)

# Make sure required files exist in static/slides/
required_files <- c(
  here::here("static", "slides", "load-feather.html"),
  here::here("static", "slides", "new.css"),
  here::here("static", "slides", "slide-setup.R")
)

missing <- required_files[!file.exists(required_files)]
if (length(missing) > 0) {
  stop("Missing required files:\n", paste(missing, collapse = "\n"))
}

# Render the Rmd to HTML
message("Rendering w1.Rmd to HTML...")
rmarkdown::render(here::here("static", "slides", "w3.Rmd"))

# Convert HTML to PDF
message("Converting w1.html to PDF...")
pagedown::chrome_print(
  here::here("static", "slides", "w3.html"),
  timeout = 120  # Increase to 120 seconds (or higher if needed)
)

message("\nSuccess! PDF created at: static/slides/w3.pdf")
message("\nNext steps:")
message("1. Commit the PDF to your repo")
message("2. Push to GitHub")
message("3. The download link in your slides footer will work at:")
message("   https://github.com/maithgopalan/c2-dataviz-2026/raw/main/static/slides/w3.pdf")