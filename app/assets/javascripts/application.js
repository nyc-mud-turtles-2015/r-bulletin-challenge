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
//= require_tree .

$(document).ready(function() {
  $("#new-message").on("submit", function(event){
    event.preventDefault();
    $.post( $(this).attr("action") , $(this).serializeArray()).done( function(result)
    {
      $("#messageslist").prepend(result);
      $("#new-message").trigger('reset');
    }).fail(function(result){
      alert(result['responseText']);
    });
});

  $("#new-conversation").on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr("action"),
      data: $(this).serialize(),
      type: $(this).attr("method")
    }).done(function(result){
      $("#conversation-list").prepend(result);
      $("#new-conversation").trigger('reset');
    }).fail(function(result){
      alert(result['responseText']);
    });
  })
})
