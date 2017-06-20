# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#total_product-form", (ev,data) ->
    ingredient_id = data.ingredient_id
    $.ajax 
        url: '/ingredients/'+data.ingredient_id
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('#table_ingredients').append "AJAX Error: #{textStatus}"
        success: (data_aux, textStatus, jqXHR) ->
            $('#table_ingredients').append("<tr>
<td>#{data_aux.name}</td>
<td><a data-confirm='Are you sure?'' class='btn btn-raised btn-danger' rel='nofollow' data-method='delete' href='/total_products/#{data.id}'>DELETE</a></td>
</tr>")