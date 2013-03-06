
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

# functioning of the helper functions
tags$head(tags$script(src = "hello", type = "goog"))
# check also:
?tags

# and now the elements to get in the html

# script requests
<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.3.js'></script>
<script src="shared/shiny.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="shared/shiny.css"/> 

<script type='text/javascript' src="http://handsontable.com/jquery.handsontable.js"></script>
<script type='text/javascript' src="http://handsontable.com/lib/bootstrap-typeahead.js"></script>
<script type='text/javascript' src="http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.js"></script>
<script type='text/javascript' src="http://handsontable.com/lib/jQuery-contextMenu/jquery.ui.position.js"></script>

<script type='text/javascript' src="shiny-handsontable.js"></script>

<link rel="stylesheet" type="text/css" href="http://handsontable.com/lib/jQuery-contextMenu/jquery.contextMenu.css">
<link rel="stylesheet" type="text/css" href="http://handsontable.com/jquery.handsontable.css">
  

# placeholder
<div id="exampleGrid" class="dataTable" type = "button"></div>

# this is the script that needs to be generated when creating the table
<script type='text/javascript'>//<![CDATA[ 
  $(window).load(function(){
    var myData = [
      ["Year", "Kia", "Nissan", "Toyota", "Honda"],
      ["2008", 10, 11, 12, 13],
      ["2009", 20, 11, 14, 13],
      ["2010", 30, 15, 12, 13]
      ];
    
    $("#exampleGrid").handsontable({
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
  });//]]>  
  
  
  
  $(document).ready(function () {
    
    function bindDumpButton() {
      $('body').on('click', 'button[name=dump]', function () {
        var dump = $(this).data('dump');
        var $container = $(dump);
        console.log('data of ' + dump, $container.handsontable('getData'));
      });
    }
    bindDumpButton();
    
  });


</script>