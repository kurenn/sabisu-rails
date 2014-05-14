capitalize = (str) ->
  str[0].toUpperCase() + str.slice(1)

$ ->
  $addButtons = $('.explorer-fields-link-js')
  fieldId = 1

  $addButtons.on 'click', (e) ->
    e.preventDefault()
    $wrapperTarget = $($(@).data('target'))
    inputType = $(@).data('type')
    singleInputType = capitalize(inputType.substring(0, inputType.length - 1).replace("_", " "))

    fieldsToAppend = "<div class='row'>
    <div class='col-5'>
    <input type='text' name='explorer[#{inputType}][#{fieldId}][#{inputType}_name_#{fieldId}]' id='explorer_#{inputType}_name_#{fieldId}' placeholder='#{singleInputType} name'/>
    </div>
    <div class='col-6'>
    <input type='text' name='explorer[#{inputType}][#{fieldId}][#{inputType}_value_#{fieldId}]' id='explorer_#{inputType}_value_#{fieldId}' placeholder='#{singleInputType} value'/>
    </div>
    <div class='col-1'>
    <a href='#' class='remove_input button radius nomargin danger three-d' data-counter='##{inputType}_counter_js'><i class='fa fa-trash-o'></i></a>
    </div>
    </div>"

    $wrapperTarget.append(fieldsToAppend)
    $("##{inputType}_counter_js").text($wrapperTarget.children().length)
    fieldId++

  $(document).on 'click', '.remove_input', (e) ->
    e.preventDefault()
    inputsWrapper = $(@).parent().parent().parent()
    counter = $($(@).data('counter'))
    $(@).parent().parent().remove()
    counter.text(inputsWrapper.children().length)

  $('#explorer_form').submit ->
    Pace.start()

  $('.appeareable').hide()

  $('#explorer_http_method').change ->
    $('#explorer_uri_pattern').val('')
    if $(@).val() is "GET" or $(@).val() is "DELETE"
      $('.appeareable').hide()
      $('.hideaway').show()
    else
      $('.appeareable').show()
      $('.hideaway').hide()
