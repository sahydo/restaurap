# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#order-process-form", (ev,data) ->
    cadena = "#status-#{data.id}"
    new_state = data.status
    $(cadena).text(new_state)
    $('#order-process-form').hide(300)
    $('#order-ready-form').show(300)
$(document).on "ajax:success", "form#order-ready-form", (ev,data) ->
    cadena = "#status-#{data.id}"
    new_state = data.status
    $(cadena).text(new_state)
    $('#order-ready-form').hide(200)
    $("#card-#{data.id}").hide(500)