
var treegridOutputBinding = new Shiny.OutputBinding();
  $.extend(treegridOutputBinding, {
    find: function(scope) {
      return $(scope).find('.treegrid-output');
    },
    renderValue: function(el, data) {
 
      var mydata = JSON.parse(data);
      //console.log('treegrid binding got data:');   
      //console.log(mydata);

      $(el).find('.easyui-treegrid').treegrid({
        data: mydata.data,
        columns:mydata.columns,
        title: mydata.title,
        rownumbers: mydata.rownumbers,
        treeField: mydata.treeField,
    		idField: mydata.idField
      });

    }
  });
Shiny.outputBindings.register(treegridOutputBinding, "shiny.treegridOutput");
