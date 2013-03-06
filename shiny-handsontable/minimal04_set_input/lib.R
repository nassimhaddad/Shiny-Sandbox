
# example from increment button
incrementButton <- function(inputId, value = 0) {
  tagList(
    singleton(tags$head(tags$script(src = "increment.js"))),
    tags$button(id = inputId,
                class = "increment btn",
                type = "button",
                as.character(value))
  )
}

spreadsheetInput <- function(inputId = "exampleGrid", value){
  
  json_content <- toJSON(value, collapse = "")
  
  dataTableDef <- sprintf('
  $(window).load(function(){
  var myData = %s;
  
  $("#%s").handsontable({
  data: myData,
  startRows: 5,
  startCols: 5,
  minSpareCols: 1,
  //always keep at least 1 spare row at the right
  minSpareRows: 1,
  //always keep at least 1 spare row at the bottom,
  rowHeaders: true,
  colHeaders: true,
  contextMenu: true
  });
});',
                          json_content,
                          inputId)
  

  tagList(
    singleton(tags$head(tags$script(src = "http://handsontable.com/jquery.handsontable.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/bootstrap-typeahead.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.js", type='text/javascript'))),
    singleton(tags$head(tags$script(src = "http://handsontable.com/lib/jQuery-contextMenu/jquery.ui.position.js", type='text/javascript'))),
    
    singleton(tags$head(tags$script(src = "shiny-handsontable.js", type='text/javascript'))),
    
    singleton(tags$head(tags$link(rel="stylesheet", type="text/css", href="http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.css"))),
    singleton(tags$head(tags$link(rel="stylesheet", type="text/css", href="http://handsontable.com/jquery.handsontable.css"))),
    
    tags$div(id=inputId, class="dataTable", type = "button"),  
    tags$script(type='text/javascript',
                dataTableDef)
  )
}

