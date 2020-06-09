#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Displacement from Weight"),
  titlePanel("The application below predicts the displacement of a vehicle based on the
             weight and horsepower of the vehicle. The first model considers only weight
             as a factor but the second model considers both weight and horsepower."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderWt","Select Weight:", 
                   min = 1, max = 6, value = 3),
       sliderInput("sliderHp","Select Horsepower:", 
                   min = 52, max = 335, value = 123)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted Displacement of Model 1 :"),
       textOutput("pred1"),
       h3("Predicted Displacement of Model 2 :"),
       textOutput("pred2")
    )
  )
))
