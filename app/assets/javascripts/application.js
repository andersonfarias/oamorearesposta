// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require jquery_ujs
//= require bxslider
//= require turbolinks

//= require js/flot/jquery.flot.js
//= require js/flot/jquery.flot.pie.js
//= require js/flot/jquery.flot.orderBars.js
//= require js/flot/jquery.flot.time.min.js

//= require js/flot/jquery.flot.spline.js
//= require js/flot/jquery.flot.stack.js
//= require js/flot/curvedLines.js
//= require js/flot/jquery.flot.resize.js

//= require js/maps/jquery-jvectormap-2.0.3.min.js
//= require js/maps/gdp-data.js
//= require js/maps/jquery-jvectormap-world-mill-en.js
//= require js/maps/jquery-jvectormap-us-aea-en.js

//= require js/datatables/jquery.dataTables.min.js

//= require js/bootstrap.min.js
//= require bootstrap3-typeahead.min
//= require bootstrap3-autocomplete-input
//= require bootstrap3-autocomplete-input-init

//= require js/gauge/gauge.min.js

//= require js/progressbar/bootstrap-progressbar.min.js

//= require js/moment/moment.min.js
//= require js/datepicker/daterangepicker.js

//= require js/chartjs/chart.min.js

//= require js/custom.js

//= require js/pace/pace.min.js

//= require  js/select/select2.full.js

//= require js/dropzone/dropzone.js
//= require js/pace/pace.min.js

//= require js/input_mask/jquery.inputmask.js

//= require libs/bootstrap-datetimepicker.min.js
//= require libs/locale/bootstrap-datetimepicker.pt-BR.js

//= require libs/jquery.numeric.js
//= require libs/canvasjs.js
//= require libs/excanvas.js
//= require libs/jquery.canvasjs.js

//= require cocoon

//= require_tree .

$(document).ready(function() {
  $('.form_datetime').datetimepicker({
        language:  'pt-BR',
        format: "dd/mm/yyyy",
        todayBtn:  1,
    		autoclose: 1,
    		todayHighlight: 1,
    		startView: 2,
    		forceParse: 0,
        showMeridian: 1,
        minView: 2
    });

  $("input.radio_buttons").each(function() {
    if ($(this).attr("disable_ops") != null && $(this).attr("disable_ops").indexOf($(this).attr("value")) >= 0) {
      $(this).prop( "disabled", true );
    }
  });

  $('input.date-input').inputmask("99/99/9999");
  $('input.phone-number').inputmask("(99)99999-9999");
  $('input.cnpj').inputmask("99.999.999/9999-99");
  $('input.cpf').inputmask("999.999.999-99");

  $('input[type="number"]').numericInput();

  $('.bxslider').bxSlider({
    mode: 'fade',
    captions: true,
    pagerCustom: '#bx-pager'
    // slideWidth: 360
  });

  Chart.defaults.global.legend = {
    enabled: false
  };

});
