
library(shiny)


shinyServer(function(input, output) {
    output$numero__sliderIO <- renderPrint({
        input$slider_input #imprime el listado de inputs que tenga
    })
    output$range_sliderIO <- renderPrint({input$range_slider})
    output$edad_sliderIO <- renderPrint({input$numeric_input})
    output$fecha_sliderIO <- renderPrint({input$single_date_input})
    output$rangofecha_sliderIO <- renderPrint({input$date_range_input})


})
