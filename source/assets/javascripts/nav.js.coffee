$ ->
$('#nav-toggle').click ->
    $(@).parent().siblings().toggleClass 'active'