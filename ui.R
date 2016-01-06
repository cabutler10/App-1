

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  bootstrapPage(
  theme="flatly",

  
  # Sidebar with a slider input for the number of bins
 #sidebarLayout(
    #sidebarPanel(
      radioButtons("A2effect_KA", 
                   label = "K1",
                   choices = c("2", "3",
                               "4", "5"),
                   selected = "2",
                   inline = TRUE),
      radioButtons("A2effect_KB", 
                   label = "K2",
                   choices = c("2", "3",
                               "4", "5"),
                   selected = "2",
                   inline = TRUE),
      sliderInput("A2_nPower", 
                  label = "Effect Size:",
                  min = .2, max = .8, value = c(.2, .8)),
      
      sliderInput("A2_nSample", 
                  label = "Sample Size:",
                  min = 2, max = 100, value = c(2, 100)),
    #),
    
    # Show a plot of the generated distribution
    mainPanel(
      shiny::textOutput("A2_nPower"),
      shiny::textOutput("A2_nSample"),
      shiny::plotOutput("plot")
    )
  )
)
)
