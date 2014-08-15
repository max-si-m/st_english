// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    $("#search_form").submit(function(){
        $.get(this.action, $(this).serialize(), null, "script");
        return false;
    });
    $(".pagination a").live("click", function(){
        $.getScript(this.href);
        return false
    });
});