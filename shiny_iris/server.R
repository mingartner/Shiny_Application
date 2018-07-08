library(shiny); library(caret); library(ggplot2); library(randomForest); library(e1071)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    options(shiny.deprecation.messages=FALSE)
    
    mod <- train(Species ~., method = "rf", data = iris)
    
    modpred <- reactive({
        if(input$SW == 0) {return(NULL)}
        
        newdata <- data.frame(Sepal.Length = input$SL, Sepal.Width = input$SW,
                              Petal.Length = input$PL, Petal.Width = input$PW)
        predict(mod, newdata = newdata)
    })
    
    output$pred1 <- renderText({
        if(input$SW == 0) {return("Please enter your measurements")}
        modpred()
    })
   
    output$plot1 <- reactivePlot(function() {
        p <- ggplot(data = iris, aes(x = Petal.Width, y = Petal.Length, col = Species)) +
            geom_point() + ggtitle("Iris Dataset") + 
            theme(plot.title = element_text(size = 20))
        
        if(input$PW != 0) {
            p <- p + geom_point(aes(x=input$PW, y = input$PL,
                                    col = modpred()), size = 5, shape = 19)
        }
        print(p)
    })
    
})
