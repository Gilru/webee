$(document).on('ready page:load', function () {
    $('.click-me a').click(function () {
        $(this).addClass('active-fill-info-bg').siblings().removeClass('active-fill-info-bg');
    });
    $('.touch-me a').click(function(){
         $(this).addClass('active-fill-pricing-bg').siblings().removeClass('active-fill-pricing-bg')
    });
});
function showonlyone(thechosenone) {
    $('.newboxes').each(function(index) {
        if ($(this).attr("id") == thechosenone) {
            $(this).slideDown(200);
        }
        else {
            $(this).slideUp(600);
        }
    });
}





//$(document).on('ready page:load', function () {
//    $('.click-me a').click(function () {
//        $(this).addClass('active-fill-info-bg').siblings().removeClass('active-fill-info-bg');
//    });
//    $('.touch-me a').click(function(){
//        $(this).addClass('active-fill-pricing-bg').siblings().removeClass('active-fill-pricing-bg')
//    });
//});
//function showonlyone(thechosenone) {
//    $('.newboxes').each(function(index) {
//        if ($(this).attr("id") == thechosenone) {
//            $(this).slideDown(200);
//        }
//        else {
//            $(this).slideUp(600);
//        }
//    });
//}
