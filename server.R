# server.R
library(htmltools)
library(shiny)
library(shinyapps)
library(shinythemes)
library(ggplot2)
library(RColorBrewer)
#datum <- read.csv("C:/Users/abutler/Desktop/App-1/graphData.csv")
datum <- read.csv("graphData.csv")

shinyServer(
  function(input, output) {
 
    output$A2_nPower <- renderText({ 
      paste("You have chosen an Effect Size that goes from",
            input$A2_nPower[1], "to", input$A2_nPower[2])
    })
    
    output$A2_nSample <- renderText({ 
      paste("You have chosen a Sample Size that goes from",
            input$A2_nSample[1], "to", input$A2_nSample[2])
    })
    
   dataset <- reactive({
     if(input$A2effect_KA=="2"&input$A2effect_KB=="2"){
    data.frame(samp=datum$row,eff=datum$col,res=datum$results22)
    } else {
      data.frame(samp=datum$row,eff=datum$col,res=datum$results24)
    }
   })
        
    #dataset <- data.frame(samp=datum$row,eff=datum$col,res=res)
    
    output$plot <- renderPlot({
      #p <- plot(dataset()$samp,dataset()$res)
       p <- ggplot(dataset()) + 
        geom_tile(aes(x=samp,y=eff,fill=res)) +
        stat_contour(data=dataset(),aes(x=samp,y=eff,z=res)) +
        xlim(input$A2_nSample[1],input$A2_nSample[2]) +
        ylim(input$A2_nPower[1],input$A2_nPower[2]) +
        scale_fill_gradientn(guide=guide_legend(title="Power"),colours=rev(brewer.pal(10,"RdYlBu"))) +
        labs(title="Predicted Power as a function of Sample and Effect Size",x="Sample Size",y="Effect Size") 
      
      print(p)
    
  }
)
  }
)
