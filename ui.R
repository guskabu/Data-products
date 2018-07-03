#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
BMI<-function(weight,height) {(weight)/((height)^2)}
#In kilograms and in cm
diagnostic_f<-function(weight,height){
  BMI_value<-(weight)/((height)^2)
  ifelse(BMI_value<18.5,"underweight",
         ifelse(BMI_value<25,"normal weight",
                ifelse(BMI_value<30,"overweight",
                       ifelse(BMI_value>35,"obesity",
                         ifelse(BMI_value<35,"obesity")))))
}


shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Shiny App Project - Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      numericInput('weight', 'Enter your weight in kilograms', 75) ,
      numericInput('height', 'Enter your height in m', 1.75, min = 1.20, max = 2.50, step = 0.01),
      submitButton('Calculate BMI')
    ), 
    mainPanel(
      p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to both men and women between the ages of 18 and 65 years.'),
      p('BMI can be used to indicate if you are overweight, obese, underweight or normal. A healthy BMI score is between 20 and 25.'),
      p('The World Health Organization (WHO) proposes the following classification for BMI Measure:'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=30        : Obesity')
        )
      ),
      
      h4('Calculating BMI based on values entered by you:'), 
      p('weight in kilograms:'), verbatimTextOutput("inputweightvalue"),
      p('height in m:'), verbatimTextOutput("inputheightvalue"),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
      
    )
    
  )   
)
