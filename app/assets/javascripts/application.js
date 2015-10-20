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
$(document).ready(function(){
  $('#new-conversation-div').on('click', '#new-conversation-link', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      type: 'GET',
      url: url
    }).done(function(response) {
      $('#new-conversation-link').hide();
      $('#new-conversation-div').append(response)
    })
  })

  $('#new-conversation-div').on('submit', '.new_conversation', function(e) {
      e.preventDefault();
      var type = $(this).attr('method');
      var url = $(this).attr('action');
      var data = $(this).serialize();
      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response) {
        $('#conversations').append(response);
        $('#new-conversation-link').show();
        $('.new_conversation').hide();
      })
    })

  $('#new-message-div').on('click', '#new-message-link', function(e) {
    e.preventDefault();
    var url = $(this).attr('href')
    $.ajax({
      type: 'GET',
      url: url
    }).done(function(response) {
      $('#new-message-link').hide();
      $('#new-message-div').append(response)
    })
  })

  $('#new-message-div').on('submit', '.new_message', function(e) {
    e.preventDefault();
    var type = $(this).attr('method');
    var url = $(this).attr('action');
    var data = $(this).serialize();
    $.ajax({
      type: type,
      url: url,
      data: data
    }).done(function(response) {
      $('#messages').append(response);
      $('#new-message-link').show();
      $('.new_message').hide();
    })
  })

  $(".message").on('click', '.like-btn', function(e) {
    e.preventDefault();
    var pointCount = $(this).parent().children('#message-points')
    var url = $(this).attr('href');
    $.ajax({
      type: 'GET',
      url: url
    }).done(function(response) {
      pointCount.html(response)
    })
  })

})
