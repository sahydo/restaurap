# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#order_product-form", (ev,data) ->
    product_id = data.product_id
    $.ajax 
        url: '/products/'+product_id
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('#table_products').append "AJAX Error: #{textStatus}"
        success: (data_aux, textStatus, jqXHR) ->
            $('#table_products').append("<tr>
                <td><a class='btn btn-defult' href='/total_products_of/#{product_id}'>#{data_aux.name}</a></td>
                <td><a data-confirm='Are you sure?'' class='btn btn-raised btn-danger' rel='nofollow' data-method='delete' href='/order_products/#{data.id}'>DELETE</a></td>
                </tr>")
            val = parseInt($('#payvalue').text())
            valTotal = parseInt(data_aux.price)+val
            $('#payvalue').text(valTotal)
            