$ ->
  $('.brief').hover ->
    $(this).siblings().toggleClass('subdued')
