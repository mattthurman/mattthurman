$ ->
  $('li.collapsible em').click ->
    $(this).parent().toggleClass('open')
