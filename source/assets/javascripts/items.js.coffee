$ ->
  previousItem = null
  toggleOpen = false

  $('.item').click ->
    if previousItem == this
      toggleOpen = !toggleOpen
    else
      toggleOpen = false

    if !toggleOpen
      $(this).removeClass('subdued').addClass('open')
      $(this).prevAll().removeClass('subdued').addClass('open')
      $(this).nextAll().removeClass('open').addClass('subdued')

    else
      $('.item').removeClass('subdued open')

    previousItem = this




  $('.items').focusout ->
    $('.item').removeClass('subdued open')