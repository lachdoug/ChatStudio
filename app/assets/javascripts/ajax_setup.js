// $.ready(function() {
//
//   $.ajaxError(function(event, request, settings, error) {
//     alert(error + " - " + request.responseText);
//   });
//
//   $.ajaxSetup({
//     headers : { 'Authorization': 'Token ' + apiToken }
//   });
//
//   // setFormsServerUrl();
//
//   // bindAjaxForm();
//
// });

// function setFormsServerUrl() {
//   document.new_room_form.action = ( serverUrl + "/rooms.json" );
//   document.new_message_form.action = ( serverUrl + "/messages.json" );
// }
//
// function bindAjaxForm() {
//   $('form').ajaxForm({
//     error: function(html, status, xhr, this_form) {
//       var errors = JSON.parse(html.responseText).errors;
//       this_form.append(errorsHtml(errors));
//     }
//   });
// };
//
// function errorsHtml(errors) {
//   return ' \
//   <p> \
//     <div class="alert alert-warning alert-dismissible"> \
//       <button class="close" data-dismiss="alert"> \
//         <span>&times;</span> \
//       </button>' +
//       errors.join('<br>') +
//     '</div> \
//   </p>'
// };
