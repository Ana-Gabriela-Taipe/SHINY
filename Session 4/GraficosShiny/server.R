
library(shiny)

#Libreria anadidas
library(ggplot2)
library(dplyr)

shinyServer(function(input, output) {
    
    output$grafica_base_r <- renderPlot({
        plot(mtcars$wt, mtcars$mpg, xlab="wt", ylab = "miles per galion")
        
        #Asi de facil, es como se agrega graficos de la base de R
    })
    
    output$grafica_ggplot <- renderPlot({
        diamonds %>%
            ggplot(aes(x=carat, y=price, color=color))+
                #en el eje x los kilates "carat"
                #en el eje y el precio "price"
                #color=color := color en base al color del diamante
            geom_point()+
            #Etiquetas:
            ylab("Precio")+
            xlab("Kilates")+
            ggtitle("Precio por kilates")
    })
    
    #SELECCION DE CLICKS
    output$plot_click_options <- renderPlot({
        plot(mtcars$wt, mtcars$mpg, xlab="wt", ylab = "miles per galion")
        
        #Resultado: este me permite seleccionar, pero no imprimir lo que estoy seleccio
        #           nando, para hacer esto en "ui.R" escribo "verbatimTextOutput()" 
    })
    
    #IMPRIME LA SELECCION DE UN CLICK
    output$click_data <- renderPrint({
        clk_sms <- NULL
        dclk_sms <- NULL
        mhover_sms <- NULL
        mbrush_sms <- NULL
        #
        #Como al principio me sale, NULL, porque no ha habido seleccion de algo, ponems:
        if(!is.null(input$clk$x)){
            clk_sms <- paste0("clickx =", round(input$clk$x,2), " clicky =", round(input$clk$y,2) )
        }
        if(!is.null(input$dclk$x)){
            dclk_sms <- paste0("dobleclickx =", round(input$dclk$x,2), " dobleclicky =", round(input$dclk$y,2) )
        }
        if(!is.null(input$mhover$x)){
            mhover_sms <- paste0("hoverclickx =", round(input$mhover$x,2), " hoverclicky =", round(input$mhover$y,2) )
        }
        if(!is.null(input$mbrush$xmin)){
            brushx <- paste0(c('(', round(input$mbrush$xmin,2),',',round(input$mbrush$xmax,2),')'), collapse='')
            brushy <- paste0(c('(', round(input$mbrush$ymin,2),',',round(input$mbrush$ymax,2),')'), collapse='')
            mbrush_sms <- cat('\t rango en x:', brushx, '\n', '\t rango en y:', brushy)
        }
        cat(clk_sms, dclk_sms, mhover_sms, mbrush_sms, sep="\n") #imprime
    })

    #PARA IMPRIMIR LOS CLICKS EN UNA TABLA
    output$mtcarsTable <- renderTable({
        ## df <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
        df <- brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
        if(nrow(df)!=0){
            df
        } else {
            NULL
        }
        })
})
