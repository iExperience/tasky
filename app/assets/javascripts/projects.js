$(function() {
  // hook up the projects search box to refresh projects
  // on every keypress (specifically: keyup)
  $('#projects_search').on('keyup', 'input', function() {
    $.get(
      $('#projects_search').attr('action'),
      $('#projects_search').serialize(), // {"q": "hello"}
      function(data) {
        $('#projects').html(data);
      },
      'html'
    );
    
    return false;
  });

  // hook up the pagination links to refresh projects
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