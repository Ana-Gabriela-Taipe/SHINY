
library(shiny)

#Librerias agregadas
library(lubridate)
    #maneja fechas en R


shinyUI(fluidPage(

    titlePanel("Catálogos de Inputs Shiny"), #titulo

    sidebarLayout(
        sidebarPanel(
            sliderInput("slider_input", #entrada deslizante
                        "Seleccione un valor:", #titulo de la barra deslizante
                        min=0,
                        max=100,
                        value = 25, #valor inicial con el que aparecerá
                        step =10,  #por defecto va de 1 en 1
                        animate = T, #se mueve solito el deslizador
                        post='%' #para simbolizar lo que estamos trabajando
                        ),
            sliderInput("range_slider",
                        "seleccione rango:",
                        min=0,
                        max=100,
                        value=c(0,100)
                            #vector que tiene el valor minimo y el valor maximao
                        ),
            numericInput("numeric_input",
                         "Seleccione edad:",
                         min=0, 
                         value=10,
                         max=120
                         ),
            dateInput("single_date_input",
                      "Ingrese la fecha:",
                      value=today(),
                      min=today()-60,
                        #es la fecha minima que el usuario pueda escojer
                        #en vez de 60, puedo poner 365, para poder escojer un año atras
                      max=today(),
                      language = "es",
                        #cambiamos el idioma por defecto que es ingles, a español
                      weekstart = 1
                        #para que empiece la semana desde Lunes
                      ),
            dateRangeInput("date_range_input",
                           "Seleccione el rango de fechas:",
                           start= today()-30,
                           end = today(),
                           language = "es",
                           separator = "a",
                            #para que en ves de "to", salga "a"
                           format = 'dd/mm/yyyy'
                            #cambio el formato de presentación
                           )
        ),

        mainPanel(
            h1("Salidas de los Inputs Shiny"),
            h2("Número"),
            verbatimTextOutput("numero__sliderIO"),
                #toda funcion out requiere una funcion input
            h2("Rango"),
            verbatimTextOutput("range_sliderIO"),
            h2("Edad"),
            verbatimTextOutput("edad_sliderIO"),
                #este es la salida para "numericInput()"
            h2("Fecha"),
            verbatimTextOutput("fecha_sliderIO"),
            h2("Rango de Fechas"),
            verbatimTextOutput("rangofecha_sliderIO"),
        )
    )
))
 
