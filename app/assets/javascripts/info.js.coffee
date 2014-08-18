$(document).on 'ready page:load', ->
   $('.click-me button').click ->
       $(this).addClass('active-fill-info-bg').siblings().removeClass('active-fill-info-bg')
