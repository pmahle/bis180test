# Imported example data system for UI


library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice SNP Data"),
  
  # Some helpful information
  helpText("This application creates various plots to show difference between",
           "rice plants collected in various areas.  Please use the radio box below to choose a trait",
           "for plotting, and a plot type"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      radioButtons("Character", #the input variable that the value will go into
                   "Choose a trait to display:",
                   c("Plant.height", "Seed.length",
                     "Seed.width", "Seed.volume",
                     "Amylose.content", "Protein.content")),
      
      radioButtons("PlotType", "Choose plot type", c("boxplot","violin")) 
      ),
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("thePlot")
    )
  )
)
)
