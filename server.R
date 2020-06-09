#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  model1 <- lm(disp ~ wt, data = mtcars)
  model2 <- lm(disp ~ hp + wt, data = mtcars)
    
  model1pred <- reactive({
  wtInput <- input$sliderWt
  predict(model1, newdata = data.frame(wt = wtInput))
  })  
    
  model2pred <- reactive({
    wtInput <- input$sliderWt
    hpInput <- input$sliderHp
    predict(model2, newdata = data.frame(wt = wtInput, hp = hpInput))
  })
  
  output$plot1 <- renderPlot({
    wtInput <- input$sliderWt
    
    plot(mtcars$wt, mtcars$disp, xlab = "Weight",
         ylab = "Displacement")
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$pred2 <- renderText({
    model2pred()
  })
  
  })
  

