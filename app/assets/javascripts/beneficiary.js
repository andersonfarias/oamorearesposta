$(document).ready(function() {
  if (gon.data != undefined) {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      animationEnabled: true,
      legend:{
        verticalAlign: "center",
        horizontalAlign: "left",
        fontSize: 20,
      },
      theme: "theme2",
      data: [
      {
        click: function(e){
          var obj = gon.detalhado.filter(function(env) {return env.key==e.dataPoint.key})[0]
          $("#show_table tbody").empty();
          obj.beneficiaries.forEach(function(value, index){
            $("#show_table tbody").append('<tr class="child"><td>'+value.first_name+" "+value.first_name+'</td></tr>');
          });
          $("#report").css("display","block")
        },
        type: "pie",       
        indexLabelFontFamily: "Helvetica",       
        indexLabelFontSize: 15,
        indexLabel: "#percent%",
        showInLegend: true,
        toolTipContent:"{y}",
        dataPoints: gon.data
      }
      ]
    });
    chart.render();
  }

  $('.close-fieldset').click(function () {
    $("#report").css("display","none")
  });

});