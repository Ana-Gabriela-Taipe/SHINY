library(shiny)

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
            checkboxInput("single_check_box",
                          "Desea recibir informacion",
                          value=FALSE
                          ),
            checkboxGroupInput("check_group_box",
                               "Seleccione tipo:",
                               choices=c("Carro", "Camionea","Moto", "Tractor"),
                               selected = NULL
                                #me dice "NULL" cuando no haya nada seleccionado
                               ),
            radioButtons("radio_input",
                         "Selecciones uno:",
                         choices = c("Primaria", "Secundaria", "Universidad"),
                            #por defecto siempre empezará con alguno seleccionado
                         ),
            actionButton("btn_ok","Refrescar"),
            actionButton("btn_salir", "Salir"), #no se lo citó en el server
            
                #Notamos que los botones saler uno a lado del otro, si deseamos que 
                #aparezcan uno bajo el otro, en medio de las dos linea de codigo, pone
                #br(),
            
                #Resultado: incrementa de 1 en 1, el numero de veces que el individuo a
                #           seleccionado tal opcion.
            
                #El uso de estos "actionButton" es que al clikear la opcion, se ejecute
                #una accion que nosotros querramos.
            br(),
            actionLink("link_seguir","siguiente"), #no se lo citó en el server
            submitButton("Ejecutar") #no se lo citó en el server
        ),
        
        mainPanel(
            h1("Salidas de los Inputs Shiny"),
            h2("Salida Check Box"),
            verbatimTextOutput("checkbox_sliderIO"),
            h2("Salida Check Group Box"),
            verbatimTextOutput("checkgroupbox_sliderIO"),
            h2("Salida del radioButtons"),
            verbatimTextOutput("radiobuttons_sliderIO"),
            h2("Salida Action Button"),
            verbatimTextOutput("actionbutton_sliderIO"),
        )
    )
))

