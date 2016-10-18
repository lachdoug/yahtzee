$(document).on('turbolinks:load', function() {

  $(".alert_close").click(function() {
    $(this).parent().slideUp();
  })

});
