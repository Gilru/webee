$(document).on 'ready page:load', ->
     $('.content-container div').hide();

     $('.click-me a').click (e) ->
         e.preventDefault();
         $('.content-container div').fadeOut('slow');
         $('#' + $(this).data('rel')).fadeIn('slow');
         $(this).addClass('active-fill-info-bg').siblings().removeClass('active-fill-info-bg')



