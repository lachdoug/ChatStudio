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
  });

  $("#stop_events_button").on('click', function(e) {
    e.preventDefault();
    stopEvents();
  });

} );

window.onbeforeunload = function () {
  // console.log('bye');
  stopEvents();
  // return "Leave page?";
};

function stopEvents() {
  showEventsStopped();
  if ( eventSource != null ) {
    eventSource.close();
    eventSource = null;
    console.log('Events stopped.');
  }
};

function startEvents() {
  stopEvents();
  showEventsRunning();
  eventSource = new EventSource('/servers/chat_studio/api/v0/events');
  eventSource.addEventListener('message', function(e){
    $("#server_events").prepend(
       JSON.stringify( JSON.parse( e.data ), null, 2) + "\n\n"
     )
   });
  eventSource.addEventListener('error', function(e){
    stopEvents();
  });
  console.log('Events started.');
};


function showEventsRunning() {
  $("#start_events_button").hide();
  $("#stop_events_button").show();
  $("#events_running_notification").show();
};

function showEventsStopped() {
  $("#stop_events_button").hide();
  $("#events_running_notification").hide();
  $("#start_events_button").show();
};




// function
