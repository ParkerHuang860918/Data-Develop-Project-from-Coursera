#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
#attach(mtcars)

# Define UI for application for multi linear regression from mtcars

shinyUI(fluidPage(
  
  # Application title
  fluidRow(column(12,titlePanel("Predict MPG from mtcars 
                                through Multi-linear Regression"))),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("wt", "Weight (1000 lbs)", min = 0, max = 5, value = 2.5, step = 0.1),
      sliderInput("qsec", "1/4 mile time", min = 10, max = 30, value = 15, step = 1)
    ),
    submitButton("Click to Predict")
  ),
  
    # print predictions
    mainPanel(
      h4(strong("The purpose of this Shiny app is to display prediction of mpg
           based on the weight and 0.25 mile time from mtcars dataset")),
      hr(),
      p("The first slider represents the range of weight (from 0 to 5), you could move the slide to change weight value"),
      p("The second slider represents the range of 0.25 mile time (from 10 to 30), you could move the slide to change qsec value"),
      p("The multi linear model is about", strong(span("95%", style="color:blue")), "accurate."),
      p("Prediction for mpg for new input values based on wt and qsec"),
      fluidRow(column(10, verbatimTextOutput("predicted_result"))),
      #verbatimTextOutput("predicted_result"),
      #verbatimTextOutput("Pvalue"),
      h4("Plot of Model"),
      plotOutput("plot_model"),
      a(href="http://rpubs.com/HUANF2C/369819", "Click here for presentation link")
      
      
    )
  )
)
