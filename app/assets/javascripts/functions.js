/* global google */
/* global selected */


$(document).ready(function(){
    $(".image").mouseenter(function(){
        $(".description").show()
    });
    $(".image").mouseleave(function(){
        $(".description").hide()
    });
});