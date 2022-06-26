library(shiny)


shinyServer(function(input, output) {
    output$numero__sliderIO <- renderPrint({
        input$slider_input #imprime el listado de inputs que tenga
    })
    output$checkbox_sliderIO <- renderPrint({input$single_check_box})
    output$checkgroupbox_sliderIO <- renderPrint({input$check_group_box})
    output$radiobuttons_sliderIO <-renderPrint({input$radio_input})
    output$actionbutton_sliderIO<-renderPrint({input$btn_ok}) #solo para Refrescar
})

