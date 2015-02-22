# server.R
library(shiny)
library(ggplot2)
library(lubridate)
library(dplyr)
library(reshape2)

options(shiny.trace = T)

wbd <- read.csv("worldbank/8_Topic_en_csv_v2.csv", skip = 2, na.strings = c("", " "))

fleb <- wbd[wbd$Indicator.Code == "SP.DYN.LE00.IN",]

cols <- names(fleb)
excludeCols <- c("X2013", "X2014", "X")
excludeIndex <- cols %in% excludeCols

leb <- fleb[,!excludeIndex]
leb <- leb[complete.cases(leb),]

countries <- sort(as.character(unique(leb$Country.Name)))

leb <- melt(leb)
leb <- mutate(leb, year = gsub("X", "", variable))

shinyServer(function (input, output) {
  
  output$countries <- renderUI({
    selectInput("countryName", "Country", countries)
  })
  
  lifeexpect <- reactive({
    leb[leb$Country.Name == input$countryName,]
  })
  
  output$lifeExpectPlot <- renderPlot({
      life <- lifeexpect()
      yearLabs <- seq(1960, 2012, by = 5) 
      print(nrow(life))
      p <- ggplot(life, aes(x = year, y = value, color = Country.Name)) + geom_point() + 
        labs(list(x= "Year", 
                  y= "Total Life Expectency (Years)", 
                  title = paste0("Life Expectency Change - ", input$countryName))) +
        scale_x_discrete(breaks = yearLabs, labels = as.character(yearLabs))
      print(p)
    })
  
})