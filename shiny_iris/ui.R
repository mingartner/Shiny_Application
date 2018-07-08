library(shiny); library(randomForest)

shinyUI(fluidPage(
  
  titlePanel("Predict Iris Species"),
  
  # Enter length and Width of Sepal and Petal, leave to 0 if not observed
  sidebarLayout(
    sidebarPanel(
        h4("Enter measurements"),
        numericInput("SW",
                     h3("Sepal Width (cm)"),
                     value = 0, min = 0, max = 10, step = 0.1),
        numericInput("SL",
                     h3("Sepal Length (cm)"),
                     value = 0, min = 0, max = 10, step = 0.1), 
        numericInput("PW",
                     h3("Petal Width (cm)"),
                     value = 0, min = 0, max = 10, step = 0.1),
        numericInput("PL",
                     h3("Petal Length (cm)"),
                     value = 0, min = 0, max = 10, step = 0.1),
        submitButton("Submit")
    ),
    
    
    # Show a plot of the iris data and predicted result
    mainPanel(
       plotOutput("plot1"),
       h3("This is probably: "),
       h2(textOutput("pred1")),
       h4("(1 - setosa, 2 - versicolor, 3 - virginica)")
    )
  )
))
