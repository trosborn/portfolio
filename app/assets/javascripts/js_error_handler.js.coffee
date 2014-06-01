$(document).ajaxError((event, xhr, settings, exception) ->
  alert xhr.responseText
)
