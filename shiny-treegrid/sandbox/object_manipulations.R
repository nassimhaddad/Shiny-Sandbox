



library(plyr)
by_group <- ddply(initial, .(group), summarize, size = mean(size))
as.list(by_group[1,])


dlply(initial, .(group), function(df)mean(df$size), .drop = FALSE)


data <- list(list(id = 1, name = "C", size = "100"),
            list(id = 2, name = "D", size = "200")
)

# flat table ####
initial <- data.frame(group = c("A", "A", "B", "B"), name = 1:4, size = 101:104,
                      stringsAsFactors = FALSE)
 data <- lapply(1:nrow(initial), function(x, data){list(id = x, name = data$name[x], size = data$size[x])},data = initial )

# usage:
# get_listed(initial[1:2,])
get_listed <- function(initial){
  lapply(1:nrow(initial), function(x, data){list(id = x, name = data$name[x], size = data$size[x])},data = initial )
}


# one level of hierarchy ####

data <-  list(list(id = 1, name = "C", size = "1 GB", 
                 children = list(list(id = 2, name = "Program Files", size = "120 MB"), 
                                 list(id = 3, name = "eclipse", size = "")
                 )
),
            list(id = 5, name = "C", size = "1 GB", 
                 children = list(list(id = 6, name = "Program Files", size = "120 MB"), 
                                 list(id = 7, name = "eclipse", size = "")
                 )
            )
)

initial <- data.frame(group = c("A", "A", "B", "B"), name = 1:4, size = 101:104,
                      stringsAsFactors = FALSE)
by_group <- ddply(initial, .(group), summarize, size = mean(size))
names(by_group)[1] <- "name"
data <- lapply(1:nrow(by_group), function(x, data){list(id = x, name = data$name[x], size = data$size[x], 
                                                        children = get_listed(initial[initial$group == data$name[x], ]))},
               data = by_group )



initial <- data.frame(group = mtcars$cyl, name = rownames(mtcars), size = mtcars$hp,
                      stringsAsFactors = FALSE)
by_group <- ddply(initial, .(group), summarize, size = mean(size))
by_group$name <- paste(by_group$group, "cyl")
get_listed <- function(initial){
  lapply(1:nrow(initial), function(x, data){list(id = x, name = data$name[x], size = data$size[x])},data = initial )
}
data <- lapply(1:nrow(by_group), function(x, data){list(id = x, name = data$name[x], size = data$size[x], 
                                                        children = get_listed(initial[initial$group == data$group[x], ]))},
               data = by_group )
data_as_list <- list(data = data,
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Hp", width = 60, align = "right"))), 
                     title = "BrowserNew", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")


# other datasets ####

data_as_list <- list(data = list(list(id = 1, name = "C", size = "hello", date = "02/19/2010", 
                                      children = list(list(id = 2, name = "Program Files", size = "120 MB", date = "03/20/2010", 
                                                           children = list(list(id = 21, name = "Java", size = "", date = "01/13/2010"), 
                                                                           list(id = 22, name = "MySQL", size = "", date = "01/13/2010"))), 
                                                      list(id = 3, name = "eclipse", size = "", date = "01/20/2010", 
                                                           children = list(list(id = 31, name = "eclipse.exe", size = "56 KB", date = "05/19/2009")))))), 
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Size", width = 60, align = "right"), 
                                         list(field = "date", title = "Date", width = 100))), 
                     title = "BrowserNew", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")

data_as_list <- list(data = list(list(id = 1, name = "C", size = "1 GB", 
                                      children = list(list(id = 2, name = "Program Files", size = "120 MB", 
                                                           children = list(list(id = 21, name = "Java", size = ""), 
                                                                           list(id = 22, name = "MySQL", size = ""))), 
                                                      list(id = 3, name = "eclipse", size = "", 
                                                           children = list(list(id = 31, name = "eclipse.exe", size = "56 KB")))))), 
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Size", width = 60, align = "right"))), 
                     title = "BrowserNew", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")

data_as_list <- list(data = list(list(id = 1, name = "C", size = "100"),
                                 list(id = 2, name = "D", size = "200")
), 
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Size", width = 60, align = "right"))), 
                     title = "BrowserNew", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")

data_as_list <- list(data = list(list(id = 1, name = "C", size = "1 GB", 
                                      children = list(list(id = 2, name = "Program Files", size = "120 MB"), 
                                                      list(id = 3, name = "eclipse", size = "")
                                      )
),
                                 list(id = 5, name = "C", size = "1 GB", 
                                      children = list(list(id = 6, name = "Program Files", size = "120 MB"), 
                                                      list(id = 7, name = "eclipse", size = "")
                                      )
                                 )
), 
                     columns = list(list(list(field = "name", title = "Name", width = 160), 
                                         list(field = "size", title = "Size", width = 60, align = "right"))), 
                     title = "BrowserNew", 
                     rownumbers = TRUE, 
                     treeField = "name", 
                     idField = "id")
