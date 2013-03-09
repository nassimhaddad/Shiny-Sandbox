
library(RJSONIO)

json_string = '{ 
            "data": [{
  "id":1,
"name":"C2",
"size":"hello",
"date":"02/19/2010",
"children":[{
"id":2,
"name":"Program Files",
"size":"120 MB",
"date":"03/20/2010",
"children":[{
"id":21,
"name":"Java",
"size":"",
"date":"01/13/2010"
},{
"id":22,
"name":"MySQL",
"size":"",
"date":"01/13/2010"
}]
},{
"id":3,
"name":"eclipse",
"size":"",
"date":"01/20/2010",
"children":[{
"id":31,
"name":"eclipse",
"size":"56 KB",
"date":"05/19/2009"
}]
}]
}],
"columns":[[  
        {"field":"name","title":"Name","width":160},  
        {"field":"size","title":"Size","width":60,"align":"right"},  
        {"field":"date","title":"Date","width":100}  
    ]],
"title":"BrowserNew",
"rownumbers": true,
"treeField": "name",
"idField": "id"
}'

data_as_list <- fromJSON(json_string)
str(data_as_list)
dput(data_as_list, control = NULL)

data_as_list <- list(list(id = 1, name = "C", size = "hello", date = "02/19/2010", 
                          children = list(list(id = 2, name = "Program Files", size = "120 MB", date = "03/20/2010", 
                                               children = list(list(id = 21, name = "Java", size = "", date = "01/13/2010"), 
                                                               list(id = 22, name = "MySQL", size = "", date = "01/13/2010"))), 
                                          list(id = 3, name = "eclipse", size = "", date = "01/20/2010", 
                                               children = list(list(id = 31, name = "eclipse.exe", size = "56 KB", date = "05/19/2009"))))))

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


toJSON(data_as_list)
