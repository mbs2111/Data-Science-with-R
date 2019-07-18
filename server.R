library(shiny)

library("quantmod")

getSymbols("AAPL")
getSymbols("MSFT")
getSymbols("IBM")
getSymbols("GOOG")



make_chart <- function(symbol, type, time_num, time_unit, log_y) {
    time_string <- paste("last", time_num, time_unit)
    
    chartSeries(eval(parse(text = symbol)), name = symbol, type = type,
                subset = time_string, log.scale = log_y,
                theme = "white")
}


shinyServer(function(input, output) {
    
    output$plot_aapl <- reactivePlot(function() {
        make_chart("AAPL", type = input$chart_type, time_num = input$time_num,
                   time_unit = input$time_unit, log_y = input$log_y)
    })
    
    output$plot_msft <- reactivePlot(function() {
        make_chart("MSFT", type = input$chart_type, time_num = input$time_num,
                   time_unit = input$time_unit, log_y = input$log_y)
    })
    
    output$plot_ibm <- reactivePlot(function() {
        make_chart("IBM", type = input$chart_type, time_num = input$time_num,
                   time_unit = input$time_unit, log_y = input$log_y)
    })
    
    output$plot_goog <- reactivePlot(function() {
        make_chart("GOOG", type = input$chart_type, time_num = input$time_num,
                   time_unit = input$time_unit, log_y = input$log_y)
    })
    
  
    
    
})