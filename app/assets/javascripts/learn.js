// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#show_translate').click(function() {
    $(".hide_block").show("slow");
});

$(document).keydown(function(eventObject){
    if (eventObject.which == 40 ) {
        $(".hide_block").show("slow");
    }
    if (eventObject.which == 38 ) {
        $(".hide_block").hide("slow");
    }

});