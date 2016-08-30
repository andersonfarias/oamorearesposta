$(document).ready(function() {
  if (gon.data != undefined) {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      animationEnabled: true,
      legend:{
        verticalAlign: "center",
        horizontalAlign: "left",
        fontSize: 15,
      },
      theme: "theme4",
      data: [
      {
        click: function(e){
          e.chart.options.data[0].dataPoints.forEach(function(value, index) {
            value.exploded = false;
          });
          e.dataPoint.exploded = true

          var beneficiaries = e.dataPoint.beneficiaries;
          $("#show_table tbody").empty();
          beneficiaries.forEach(function(value, index){
            $("#show_table tbody").append('<tr class="child"><td>'+value.first_name+" "+value.first_name+'</td></tr>');
          });
          $("#report").css("display","block");
        },

        type: "pie",       
        // indexLabelFontFamily: "Helvetica",
        indexLabelFontSize: 15,
        indexLabel: "#percent%",
        showInLegend: true,
        toolTipContent:"{legendText}: {y}",
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