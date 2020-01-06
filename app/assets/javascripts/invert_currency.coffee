$(document).ready ->
 
  $('#invert_currency').click  ->
    
    if $('form').attr('action') == '/convert'

      a = $("#source_currency").val()
      b = $("#target_currency").val()
      $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
                  source_currency: b
                  target_currency: a
                  amount: $("#amount").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
            a = $('#source_currency').val()
            b = $('#target_currency').val()
            $('#source_currency').val(b)
            $('#target_currency').val(a)
            

        return false;