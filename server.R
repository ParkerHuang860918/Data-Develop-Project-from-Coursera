#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
#attach(mtcars)

# Define server logic required to predict mpg based on the new input values


shinyServer(function(input, output) {
  
  model <- lm(mpg~ wt + qsec, mtcars)
  
  model_result <- reactive({
    
    # build data frame
    newdata <- data.frame(wt=input$wt, qsec = input$qsec)
    
    # Generate individual prediction
    predict(model, newdata)
    
  
  })
  
  # print individual prediction
  output$predicted_result <- renderText({
    model_result()
    
  })
  
  output$plot_model <-renderPlot({
    plot(mtcars$wt, mtcars$qsec, xlab = "weight", ylab = "mile in time", col="blue", pch = 16, cex=2)
    points(input$wt, input$qsec, col="green", cex=4, pch = 18)
  })
  
  
})