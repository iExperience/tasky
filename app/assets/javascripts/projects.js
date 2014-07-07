function update_projects() {
  $.get(
    $('#projects_search').attr('action'),
    $('#projects_search').serialize(), // {"q": "hello"}
    function(data) {
      $('#projects').html(data);
    },
    'html'
  );
  
  return false;
}

$(function() {
  $('#projects_search input').keyup(update_projects);

  $('#projects').on('click', '.pagination a', function() {
    $.get(
      this.href,
      null, // {"q": "hello"}
      function(data) {
        $('#projects').html(data);
      },
      'html'
    );

    return false;
  });
});