function loadRoomsList() {
  $.getJSON(serverUrl + "api/v0/rooms", function(rooms) { alert(JSON.stringify(rooms)); });
  // $('body').prepend( modal('Rooms', rooms) );

};

var eventSource = null;

$( document ).on( 'turbolinks:load', function() {

  stopEvents();

  $("#start_events_button").on('click', function(e) {
    e.preventDefault();
    startEvents();
    $("#start_events_button").hide();
    $("#stop_events_button").show();
  });

  $("#stop_events_button").on('click', function(e) {
    e.preventDefault();
    stopEvents();
    $("#stop_events_button").hide();
    $("#start_events_button").show();
  });

} );

window.onbeforeunload = function () {
  console.log('bye');
  stopEvents();
  // return "Leave page?";
};

function stopEvents() {
  if ( eventSource != null ) {
    eventSource.close();
    eventSource = null;
    console.log('Events stopped.');
  }
};

function startEvents() {
  stopEvents();
  eventSource = new EventSource('/api/v0/events');
  eventSource.addEventListener('message', function(e){
    $("#server_events").prepend(
       JSON.stringify( JSON.parse( e.data ), null, 2) + "\n\n"
  )});
  console.log('Events started.');
};





// function
