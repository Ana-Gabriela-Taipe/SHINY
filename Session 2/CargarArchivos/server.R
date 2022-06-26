
library(shiny)

#Librerias añadidas

library(readr)
    #para leer el archivo .csv
library(DT)
    #para mejorar 


shinyServer(function(input, output) {
    
    #--------- FUNCION QUE VA A CARGAR EL ARCHIVO -----------------
    archivo_cargado <- reactive({
        contenido_archivo<- input$file_upload
            #lista que me dira, el nombre, la ruta, que contiene el archivo
        
        #Antes de cargarla, si no hay ningun archivo cargado, nos ponga la tabla vacia:
        if(is.null(contenido_archivo)){
            return(NULL)
        }
        
        #Al pasar este chequeo, paso al siguiente paso: verificar el tipo de archivo
            #En este caso sabemos que es un archivo .csv, por ende leo la libreria en R
            #que permita leer este tipo de archivos, "library(readr)".
        
        archivo_salida <- read.csv(contenido_archivo$datapath)
            #$datapath := nos da la direccion en el servidor, donde está el archivo
        
        #Retornamos el archivo
        return(archivo_salida)
        
    })
    #--------- fin FUNCION QUE VA A CARGAR EL ARCHIVO --------------

    
    #--------- FUNCION QUE VA A MOSTRAR EL ARCHIVO -----------------
    #output$contenido_archivo <- renderTable({
    #    head(archivo_cargado(), 50)
            #me muestra los primero 50 elementos
    #})
    #--------- fin FUNCION QUE VA A MOSTRAR EL ARCHIVO --------------

    
    #--------- FUNCION QUE VA A MOSTRAR EL ARCHIVO MEJORADO Y DINAMICO -----------------
    output$contenido_archivo <- DT::renderDataTable({
        DT::datatable(archivo_cargado())
            #para que se vea mejor y se ajuste mejor la tabla
    })
    #--------- fin FUNCION QUE VA A MOSTRAR EL ARCHIVO MEJORADO Y DINAMICO --------------
})
