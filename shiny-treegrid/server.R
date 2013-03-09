library(shiny)
library(RJSONIO)
library(plyr)

# getting a dataset to display. this is very messy.
initial <- data.frame(group = mtcars$cyl, name = rownames(mtcars), size = mtcars$hp,
                      stringsAsFactors = FALSE)
by_group <- ddply(initial, .(group), summarize, size = mean(size))
by_group$name <- paste(by_group$group, "cyl")

get_listed <- function(initial, n){
  lapply(1:nrow(initial), function(x, data){list(id = x+n, name = data$name[x], size = data$size[x])},data = initial )
}
data <- lapply(1:nrow(by_group), function(x, data){list(id = x, name = data$name[x], size = data$size[x], 
                                                        children = get_listed(initial[initial$group == data$group[x], ], 10*x))},
               data = by_group )
data_as_list <- list(data = data,
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Hp", width = 60, align = "right"))), 
                     title = "TreeGrid", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")

json_string <- toJSON(data_as_list, collapse = " ")
 

shinyServer(function(input, output) {

  output$testGrid <- reactive({
    return(json_string)
  })
  
})
