

library(RJSONIO)

json_string <- '[{
  "id":1,
	"name":"C",
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
"name":"eclipse.exe",
"size":"56 KB",
"date":"05/19/2009"
}]
}]
}]'

data_as_list <- fromJSON(json_string)
str(data_as_list)
dput(data_as_list, control = NULL)

data_as_list <- list(list(id = 1, name = "C", size = "hello", date = "02/19/2010", 
                          children = list(list(id = 2, name = "Program Files", size = "120 MB", date = "03/20/2010", 
                                               children = list(list(id = 21, name = "Java", size = "", date = "01/13/2010"), 
                                                               list(id = 22, name = "MySQL", size = "", date = "01/13/2010"))), 
                                          list(id = 3, name = "eclipse", size = "", date = "01/20/2010", 
                                               children = list(list(id = 31, name = "eclipse.exe", size = "56 KB", date = "05/19/2009"))))))

toJSON(data_as_list)
