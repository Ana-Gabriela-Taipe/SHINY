
library(shiny)

shinyUI(fluidPage(

    titlePanel("Gráficas en Shiny"),

    shiny::tabsetPanel(
        tabPanel("Graficos",
                 h1("Graficas en Shiny"),
                 plotOutput("grafica_base_r"), 
                 # plotOutput():= para poder hacer graficas
                 plotOutput("grafica_ggplot")
                 ),
        tabPanel("Interaccion con los graficos",
                 plotOutput("plot_click_options",
                            click="clk",
                                #para saber cuando da un click
                            dblclick = "dclk",
                                #para saber cuando da doble click
                            hover='mhover',
                                #para saber cómo está pasando el mouse
                            brush ='mbrush'),
                                #para saber cuando hizo un brush, es decir, selecciono
                                #en forma de un recuadro
                            #PARA IMPRIMIR LOS CLICKS
                            verbatimTextOutput("click_data"),
                            #PARA IMPRIMIR LOS CLICKS EN UNA TABLA
                            tableOutput("mtcarsTable")
                 )
    )
    
    #Como saber en que coordenada de la grafica el usuario hizo click
    
))
