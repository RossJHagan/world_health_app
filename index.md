# Shiny Application for Rendering Health Data from the World Bank

This is the source code for a shiny application written in R that renders the life expectancy from the World Bank Health data set.

In order to run this locally the package expects a configuration file called `config.json`.  You should duplicate the config.dist.json which contains the placeholder values and fill in your own parts for `shinyapps.io`.

When you have a config file in place, run setup.R to install packages, shinyapps and prepare for running.

You can run the app locally with `runApp()`.  Deploy with `deployApp()`.