var offscreen = function () {

    var container = $(".app"),
        canvasDirection,
        direction;

    function hide() {
        container.removeClass("offscreen move-left move-right");
        canvasDirection = "";
    }

    function toggle(direction) {
        if (direction !== undefined && direction === "rtl") {
            container.toggleClass("move-right").removeClass("move-left");
            canvasDirection = "rtl";
        } else {
            container.toggleClass("move-left").removeClass("move-right");
            canvasDirection = "ltr";
        }
    }

    function fixSlimScroll() {
        if (canvasDirection === "ltr") {
            if ($(".offscreen-left").find(".slimScrollDiv").length !== 0) {
                $(".main-navigation").slimScroll({
                    height: 'auto'
                });
            }
        }
    }

    function events() {

        $("[data-toggle=offscreen]").on("click", function (e) {

            e.preventDefault();

            direction = $(this).data("move");

            if (direction === canvasDirection) {
                hide();
                return;
            }

            toggle(direction);

            fixSlimScroll();

        });

        $(".exit-offscreen").on("click", function (e) {
            e.preventDefault();
            hide();
        });
    }

    return {
        init: function () {
            events();
        }
    };
}();

$(function () {
    "use strict";
    offscreen.init();
});