$(document).ready(function() {
  $('#calendar').fullCalendar({ defaultView: 'basicWeek' });

  $('#new_event').on('submit', function(e) {
    e.preventDefault();
    $.post('events', $(this).serialize(), function(response) {
      $('#calendar').fullCalendar('renderEvent', {
        title: response.title,
        start: response.start_date,
        end: response.end_date,
        color: '#F3A100',
        textColor: '#000'
      })
    });
  })
});
