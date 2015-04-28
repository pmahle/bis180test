
library(shiny)
library(ggplot2)
load("GWAS_data_for_shiny.Rdata")


# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$thePlot <- renderPlot({
    
    
    # set up the plot - modifying to use GWAS 
    
    # Create and view single histogram of all of the Protein.content data
    #qplot(x="popID",y=input$Character,geom=input$PlotType,data=data.pheno.mds)
    
    plot <- ggplot(data = data.pheno.mds,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="popID",
                            y=input$Character,
                            fill="popID"
                 ) 
    )
    
    
    # draw the boxplot for the specified trait
    if (input$PlotType == "violin")
    {
      print("Violin reached")
      plot + geom_violin()
    }else
    

       {if (input$PlotType == "boxplot")
     {
       print("Boxplot reached")
       plot + geom_boxplot()
     }
       }
    
    

 
      
    
  })
})
