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
        tabsetPanel(
            id = 'dataset',
            tabPanel(
                'Plot',
                plotOutput('plotByAttribute'),
                plotOutput('plotByDim')
            ),
            tabPanel(
                'Help',
                p(
                    'Source code:',
                    a(href = 'https://github.com/namkha87/data-products-assignment', 'https://github.com/namkha87/data-products-assignment')
                ),
                p('How to use:'),
                tags$ul(
                    tags$li('Select diamond attribute to plot'),
                    tags$li('Select diamond dimmension to plot'),
                    tags$li('Select color')
                )
            )
        )
    )
))