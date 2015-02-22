# ui.R
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  title = "World Health - Life Expectency",
  headerPanel("World Health Life Expectency"),
  div(class = "help-block", "This application serves as a convenient",
                            "way to visualise total life expectencies across countries"),
  div(class = "fluid-container",
  fluidRow(
    column(width = 12,
      div(class="alert alert-info", 
          h4("Documentation"),
          p("To use this application, simply select another country ",
            "from the 'Country' option list.  You can view some regions from",
            "the list (for example 'Arab World'), and even see the global ",
            "rate of change by choosing 'World'."),
      a(span(class="glyphicon glyphicon-new-window"), 
            "Source data at WorldBank site", 
            href="http://data.worldbank.org/indicator#topic-8")))),
    column(width = 12, 
      uiOutput('countries')),
    plotOutput("lifeExpectPlot")
  )))