# setup 
# setwd("custom_fullpage")
source("setup.R")

# ui
ui <- fullPage(
  
  # settings
  includeCSS("custom_css.css"),
  opts = options,
  
  # menu
  menu = c("Intro" = "intro",
           "Section 1" = "s1",
           "Section 2" = "s2",
           "Section 3" = "s3",
           "Section 4" = "s4",
           "About" = "about"),
  # intro
  fullSection(
    center = TRUE,
    menu = "intro",
    h1("This is the Intro page")
  ),
  
  # section 1
  fullSection(
    center = TRUE,
    menu = "s1",
    h1("This is Section 1")
  ),
  
  # section 2
  fullSection(
    menu = "s2",
    fullSlide(
        center = TRUE,
        h3("This is Section 2"),
        h3("Slide 1")
    ),
    fullSlide(
        center = TRUE,
        h3("This is Section 2"),
        h3("Slide 2")
    ),
    fullSlide(
        center = TRUE,
        h3("This is Section 2"),
        h3("Slide 3")
    )
  ),
  
  # section 3
  fullSection(
    center = TRUE,
    menu = "s3",
    h1("This is Section 3")
  ),
  
  # section 4
  fullSection(
    center = TRUE,
    menu = "s4",
    h1("This is Section 4")
  ),
  
  # extra
  fullSection(
    menu = "about",
    highchartOutput('chart1'))
)

# server
server <- function(input, output){
  
  output$chart1 <- renderHighchart({
    highcharts_demo()
  })
  
}

# run app
shinyApp(ui, server)