$ ->
  $addButton = $('#add_header')
  $headerInputsWrapper = $('#header_inputs')
  fieldId = 1

  $addButton.click (e) ->
    e.preventDefault()
    $headerInputsWrapper.append("<div class='row'>
    <div class='col-6'>
    <input type='text' name='explorer[headers][#{fieldId}][header_name_#{fieldId}]' id='explorer_header_name_#{fieldId}' placeholder='Header name'/><a href='#' class='remove_input'>&times;</a>
    </div>
    <div class='col-6'>
    <input type='text' name='explorer[headers][#{fieldId}][header_value_#{fieldId}]' id='explorer_header_value_#{fieldId}' placeholder='Header value'/><a href='#' class='remove_input'>&times;</a>
    </div>
    </div>")
    fieldId++


  $(document).on 'click', '.remove_input', (e) ->
    e.preventDefault()
    $(@).parent('div').remove()

  $addUrlParamButton = $('#add_url_param')
  $urlParamsInputsWrapper = $('#url_params_inputs')
  urlParamFieldId = 1

  $addUrlParamButton.click (e) ->
    e.preventDefault()
    $urlParamsInputsWrapper.append("<div class='row'>
    <div class='col-6'>
    <input type='text' name='explorer[url_params][#{urlParamFieldId}][url_params_name_#{urlParamFieldId}]' id='explorer_url_params_name_#{urlParamFieldId}' placeholder='Param name'/><a href='#' class='remove_input'>&times;</a>
    </div>
    <div class='col-6'>
    <input type='text' name='explorer[url_params][#{urlParamFieldId}][url_params_value_#{urlParamFieldId}]' id='explorer_url_params_value_#{urlParamFieldId}' placeholder='Param value'/><a href='#' class='remove_input'>&times;</a>
    </div>
    </div>")
    urlParamFieldId++
