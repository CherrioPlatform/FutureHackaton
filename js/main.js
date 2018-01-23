jQuery(document).ready(function($) {
    $('.btnShareArticleFB').on('click',function(){
        FB.getLoginStatus(function (response) {
            var obj = {
                method: 'share',
                href: current_url,
            };
            // console.log(response);
            function callback(response) {

            }
            FB.ui(obj, callback);
        });
    });
    $("#owl-campaign").owlCarousel({
        navigation: true,
        navigationText: ['<span class="ion-ios-arrow-back"></span>', '<span class="ion-ios-arrow-forward"></span>'],
        loop: true,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        singleItem: true,
        afterInit: makePages,
        afterUpdate: makePages
    });
    function makePages() {
        $.each(this.owl.userItems, function (i) {
            $('.owl-controls .owl-page').eq(i)
                .css({
                    'background': 'url(' + $(this).find('img').attr('src') + ')',
                    'background-size': 'cover',
                })
        });
    };
});