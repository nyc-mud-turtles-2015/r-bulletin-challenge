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
// = require_tree .
//= require handlebars-v4.0.2

$(document).ready(function(){
  var topicsSource   = $("#topics-template").html();
  var topicsTemplate = Handlebars.compile(topicsSource);

  var topicShowSource   = $("#topic-show-template").html();
  var topicShowTemplate = Handlebars.compile(topicShowSource);

  $.ajax({
    url: '/api/topics',
    dataType: 'json'
  }).then(function(response){
    var html = topicsTemplate({topics: response});
    $('#welcome-index').html(html);
  }).fail(function(){
    console.log('fail');
  });

  $('#welcome-index').on('click', '.topic-link', function(event){
    event.preventDefault();
    var topicId = $(this).data('id');
    var $topicDiv = $(this).parent();
    $.ajax({
      url: '/api/topics/'+topicId,
      dataType: 'json'
    }).then(function(response){
      if ($topicDiv.find('.individual-topic').length === 0) {
        var html = topicShowTemplate(response);
        $topicDiv.append(html);
      } else {
        $topicDiv.find('.individual-topic').toggle()
        }
    }).fail(function(){console.log("YOU FAILED")})
  });

})
