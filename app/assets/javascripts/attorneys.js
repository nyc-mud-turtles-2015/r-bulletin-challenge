$(document).on('ready', function() {
  $('#name-search').on('submit', nameSearch);
  $('#firm-search').on('submit', firmSearch);
});

var dataSource = 'https://data.ny.gov/resource/eqw2-r5nb.json';

function nameSearch(event) {
  event.preventDefault();
  var lastName = $('#atty_name').val().toUpperCase();
  var url = dataSource + '?last_name=' + lastName + '&$order=first_name';
  $.ajax({
    url:      url,
    dataType: 'json'
  }).done(searchDone).fail(searchFail);
}

function firmSearch(event) {
  event.preventDefault();
  var firmName = $('#firm_name').val().toUpperCase();
  var url = dataSource + "?$where=starts_with(company_name, '" + firmName + "')&$order=last_name";
  $.ajax({
    url:      url,
    dataType: 'json'
  }).done(searchDone).fail(searchFail);
}

function searchDone(response) {
  var source   = $("#atty-template").html();
  var template = Handlebars.compile(source);
  var attyList = template(response)
  $('#search-results').html(attyList);
}

function searchFail(response) {
  alert('Heather broke it');
}
