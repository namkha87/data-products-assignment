library(shiny)
library(ggplot2)

plotPriceByCut <- function () {
    ggplot(diamonds, aes(factor(cut), price, fill = cut)) + 
        geom_boxplot() +
        ggtitle('Diamond Price by Cut') +
        xlab('Type of Cut') + 
        ylab('Diamond Price')
}

plotPriceByClarity <- function () {
    ggplot(diamonds, aes(factor(clarity), price, fill = clarity)) + 
        geom_boxplot() +
        ggtitle('Diamond Price by Clarity') +
        xlab('Clarity') + 
        ylab('Diamond Price')
}

plotPriceByColor <- function () {
    ggplot(diamonds, aes(factor(color), price, fill = color)) + 
        geom_boxplot() +
        ggtitle('Diamond Price by Color') +
        xlab('Color') + 
        ylab('Diamond Price')
}

plotPriceByX <- function(color) {
    ggplot(diamonds, aes(x = x, y = price)) +
        geom_point(alpha = 1/20, colour = color) +
        ggtitle('Diamond Price by X')
}

plotPriceByY <- function(color) {
    ggplot(diamonds, aes(x = y, y = price)) +
        geom_point(alpha = 1/20, colour = color) +
        ggtitle('Diamond Price by Y')
}

plotPriceByDepth <- function(color) {
    ggplot(diamonds, aes(x = depth, y = price)) +
        geom_point(alpha = 1/20, colour = color) +
        ggtitle('Diamond Price by Depth')
}

shinyServer(function(input, output) {
    output$plotByAttribute <- renderPlot({
        if (input$attribute == 'cut')
            return(plotPriceByCut())
        if (input$attribute == 'clarity')
            return(plotPriceByClarity())
        if (input$attribute == 'color')
            return(plotPriceByColor())
    })
    output$plotByDim <- renderPlot({
        if (input$dim == 'x')
            return(plotPriceByX(input$color))
        if (input$dim == 'y')
            return(plotPriceByY(input$color))
        if (input$dim == 'depth')
            return(plotPriceByDepth(input$color))
    })
})