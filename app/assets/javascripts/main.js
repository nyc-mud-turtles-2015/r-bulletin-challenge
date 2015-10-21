$(document).ready(function(){

  $('body').on("click", ".top-crimes-link", renderCrimes);
  $('.top-crimes-list').on("click", ".crime", renderCriminals);
});

function renderCrimes(event) {
  event.preventDefault();

  var source = $('#crimes-template').html();
  var template = Handlebars.compile(source);

  // build ajax request
  var jsonPrepend = "https://jsonp.afeld.me/?&url="
  var url = jsonPrepend + event.target.href;
  var dataType = 'json';

  $.ajax({url: url, dataType: dataType})
  .done(function(response) {
    response.forEach(function(crime) {
      var html = template(crime);

      $('.top-crimes-list').append(html);
    });
  })
  .fail(function(response) {
    console.log("ajax failed", response);
  });
}

function renderCriminals(event) {
  event.preventDefault();

  var source = $('#player-template').html();
  var template = Handlebars.compile(source);
  var crime = event.target.id;

  // build ajax request
  var jsonPrepend = "https://jsonp.afeld.me/?&url=";
  var url = jsonPrepend + event.target.href;
  var dataType = 'json';

  $.ajax({url: url, dataType: dataType})
  .done(function(response) {
    response.forEach(function(criminal) {
      var html = template(criminal);

      $('.crime #' + crime).append(html);
    });
  })
  .fail(function(response) {
    console.log("ajax failed", response);
  });
}
