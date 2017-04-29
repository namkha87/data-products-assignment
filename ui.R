library(shiny)
library(colourpicker)

shinyUI(pageWithSidebar(
    headerPanel('Diamonds Price Analysis'),
    sidebarPanel(
        h3('Diamond price by attribute'),
        p('We show price distribution according to diamond attribute e.g. cut, clarity, color'),
        radioButtons('attribute', 'Select diamond attribute:', 
                     c('Cut' = 'cut',
                       'Clarity' = 'clarity',
                       'Color' = 'color')),
        h3('Diamond price by dimension'),
        p('We show the correlation between price and diamond dimension'),
        radioButtons('dim', 'Select diamond dimension:', 
                     c('X' = 'x',
                       'Y' = 'y',
                       'Depth' = 'depth')),
        colourInput("color", "Select color", value = "red")
    ),
    mainPanel(
        plotOutput('plotByAttribute'),
        plotOutput('plotByDim')
    )
))