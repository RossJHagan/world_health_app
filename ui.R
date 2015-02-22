# ui.R
library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  title = "World Health - Life Expectancy",
  headerPanel("World Health Life Expectancy"),
  div(class = "help-block", "This application serves as a convenient",
                            "way to visualise total life expectancies across countries"),
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
      div(class="alert alert-warning",
          span(class="glyphicon glyphicon-warning-sign"),
          "Please allow approximately 30 seconds for the data to load"
      ),
      uiOutput('countries')),
    plotOutput("lifeExpectPlot")
  )))