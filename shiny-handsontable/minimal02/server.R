library(shiny)

# Minimal Custom
shinyServer(function(input, output) {
  
  table_data <- reactive({
    input$exampleGrid
  })
  
  output$table_text <- renderPrint({
    table_data()
  })
  
})
