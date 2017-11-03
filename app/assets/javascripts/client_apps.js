$( document ).on( 'turbolinks:load', function() {

  if ( $("#editor").length ) {
    var editor = ace.edit("editor");
    editor.getSession().setMode("ace/mode/html")
    $("#editorSave").click( saveClientSource );
    $("#editor").focus();



    window.onbeforeunload = function () {
      if ( $("#editor").length ) {
        return "Leave page?";
      }
    };



  };



});

function saveClientSource() {
  var sourceCode = ace.edit("editor").getValue();
  $('#client_app_source').val(sourceCode);
  $('#client_app_source').parents('form').children('input[type="submit"]').click();
  // $('#editor').remove();
};

function closeClientSource(e) {
  var editorText = ace.edit("editor").getValue();
  var formText = $('#client_app_source').val();
  if ( editorText != formText ) {
    var confirmed = confirm("Are you sure that you want to close the editor and lose your unsaved changes?");
    if (confirmed != true) {
      e.preventDefault();
      return false;
      // window.location = $(e.target).closest('a').data('path');
    }
  };
};
