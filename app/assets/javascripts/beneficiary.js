$(document).ready(function() {
  if (gon.data != undefined) {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      animationEnabled: true,
      exportFileName: "Grafico",
      legend:{
        itemclick: function(e){
          click_event(e);
          e.chart.render();
        },
        verticalAlign: "center",
        horizontalAlign: "left",
        fontSize: 15,
        itemWidth:200,
      },
      theme: "theme4",
      data: [
      {
        click: function(e){
          click_event(e);
        },
        type: "pie",       
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

  function click_event(e) {
    e.chart.options.data[0].dataPoints.forEach(function(value, index) {
      value.exploded = false;
    });

    e.dataPoint.exploded = true

    if ($.fn.dataTable.isDataTable( '#show_table' )) {
      $("#show_table").DataTable().destroy();
      $("#show_table tbody").empty();
    }

    var beneficiaries = e.dataPoint.beneficiaries;
    beneficiaries.forEach(function(value, index){
      $("#show_table tbody").append('<tr class="child">'+
        '<td class="col-md-2">'+value.id+'</td>' +
        '<td class="col-md-10">'+value.first_name+" "+value.last_name+'</td></tr>');
    });

    $("#report").css("display","block");
    $("#show_table").DataTable({
      searching: false,
      lengthChange: false,
      // info: false,
      language: {
        info: "Exibindo _START_ ao _END_ de _TOTAL_",
        paginate: {
            previous:   "Anterior",
            next:       "Próximo"
        }
      }
    });
  }

  $('.close-fieldset').click(function () {
    $("#report").css("display","none")
  });

});