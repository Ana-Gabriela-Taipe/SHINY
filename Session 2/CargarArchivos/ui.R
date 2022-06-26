
library(shiny)

shinyUI(fluidPage(

    titlePanel("Ejemplo de carga de archivo"),

    sidebarLayout(
        sidebarPanel(
            fileInput("file_upload",
                      "Cargar Archivo:"),
                #automaticamente nos da una ventana de nuestro Explorador
                #pero falta un Output para mostrarlo
        ),


        mainPanel(
            #tableOutput("contenido_archivo"), #no me compila una tabla tan bonita
            DT::dataTableOutput("contenido_archivo") 
                #me compila una tabla bonita y dinamica
        )
    )
))
