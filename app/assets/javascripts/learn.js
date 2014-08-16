// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#show_translate').click(function() {
    $(".hide_block").show("slow");
});

$(document).keydown(function(eventObject){
//    key DOWN
    if (eventObject.which == 40 ) {
        $(".hide_block").show("slow");
    }
//    key UP
    if (eventObject.which == 38 ) {
        $(".hide_block").hide("slow");
    }
//    key LEFT
    if (eventObject.which == 37 ) {
        document.getElementById('unknow').click();
    }
//   key RIGHT
    if (eventObject.which == 39 ) {
        document.getElementById('know').click();
    }

});