$( document ).on( 'turbolinks:load', function() {

  if ( $("#editor").length ) {
    var editor = ace.edit("editor");
    editor.getSession().setMode("ace/mode/html")
    $("#editorSave").click( saveClientSource );
  };

});

function saveClientSource() {
  var sourceCode = ace.edit("editor").getValue();
  $('#client_app_source').val(sourceCode);
  $('#client_app_source').parents('form').children('input[type="submit"]').click();
  // $('#editor').remove();
};
