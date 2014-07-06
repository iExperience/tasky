$(function() {
  $('#projects_search input').keyup(function() {
    $.get($("#projects_search").action, $("#projects_search").serialize(), function(data, status) {
      $('#projects').html(data);
    }, "html");
    return false;
  });

  $('#projects').on('click', '.pagination a', function() {
    $.get(this.href, null, function(data, status) {
      $('#projects').html(data);
    }, "html");
    return false;
  });
});