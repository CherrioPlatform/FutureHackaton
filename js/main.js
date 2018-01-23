jQuery(document).ready(function($) {
    $('.btnLogin').on('click',function(e){
        e.preventDefault();
        LoginForm($(this));
    });
    $('.btnRegister').on('click',function(e){
        e.preventDefault();
        RegisterForm($(this));
    });
    $('.btnForgotPassword').on('click',function(e){
        e.preventDefault();
        ForgotPasswordForm($(this));
    });
    $('.btnSaveNewPassword').on('click',function(e){
        e.preventDefault();
        SaveNewPasswordConfirm($(this));
    });
    // Submit login form
    function LoginForm(obj){
        ClearFormMsg();
        var formID = "#login_form";
        var formData = $(formID).serialize();
        jQuery.ajax({
            type: "POST",
            url: base_urll +"login/login_form",
            data: formData,
            success: function(resp) {
                if (resp.status == true) {
                    location.reload(true);
                }
                else{
                    $.each(resp.errors, function(i, item) {
                        $(".error-message").append(item);
                        $(".error-message").show();
                    });
                }
            }
        });
    }
    // Submit registration form
    function RegisterForm(obj){
        $(".register_validation").remove();
        var formID = "#registerForm";
        var formData = $(formID).serialize();

        jQuery.ajax({
            type: "POST",
            url: base_urll +"login/save_registration",
            data: formData,
            success: function(resp) {
                console.log(resp);
                if (resp.status == true) {
                    $(formID).html("Your information has been sent successfully. In order to complete your registration, please click the confirmation link in the email that we have sent to you.<br>" +
                        "<br>Please check, whether the email is in the junk folder of your email account, since confirmation mails with backlinks are sometimes classified as spam.");
                    // $(formID).html("Your registration was successful. Rediredting to login page...");
                    /* setTimeout(function(){
                     window.location = base_urll + "login"
                     }, 2000);*/

                }
                else{
                    $.each(resp.errors, function(i, item) {
                        $("#"+i).parent().append("<span class='register_validation'>"+item+"</span>")
                    });
                }
            }
        });
    }
    // Submit forgot password
    function ForgotPasswordForm(obj){
        ClearFormMsg();
        var formID = "#subscribeForm";
        var formData = $(formID).serialize();
        jQuery.ajax({
            type: "POST",
            url: base_urll +"login/contact_us_form",
            data: formData,
            success: function(resp) {
                if (resp.status == true) {
                    $(".success-message").html("<p>Check your e-mail for confirmation.</p>");
                    $(".success-message").show();
                    $("#email").val("");
                    //SendEmail(formData);
                }
                else{
                    $.each(resp.errors, function(i, item) {
                        $(".error-message").html(item);
                        $(".error-message").show();
                    });
                }
            }
        });
    }
    // Submit new password form
    function SaveNewPasswordConfirm(obj){
        ClearFormMsg();
        var formID = "#subscribeForm";
        var formData = $(formID).serialize();
        jQuery.ajax({
            type: "POST",
            url: base_urll +"login/update_password",
            data: formData,
            success: function(resp) {
                // console.log(resp);
                if (resp.status == true) {
                    $(".success-message").html("<p>Password is successfuly changed. You can now login. </p>");
                    $(".success-message").show();
                    setTimeout(function(){
                        window.location = base_urll + "login"
                    }, 2000);
                    //SendEmail(formData);
                }
                else{
                    $.each(resp.errors, function(i, item) {
                        $(".error-message").html(item);
                        $(".error-message").show();
                    });
                }
            }
        });
    }
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

    function ClearFormMsg() {
        $(".error-message").html('');
        $(".error-message").hide();
        $(".success-message").html('');
        $(".success-message").hide();
    }

    /* PLUGINS */

    // Image slider - campaign details
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

    // Menu Mobile
    var toggles = document.querySelectorAll(".c-hamburger");
    for (var i = toggles.length - 1; i >= 0; i--) {
        var toggle = toggles[i];
        toggleHandler(toggle);
    }
    ;
    function toggleHandler(toggle) {
        toggle.addEventListener("click", function (e) {
            e.preventDefault();
            (this.classList.contains("is-active") === true) ? this.classList.remove("is-active") : this.classList.add("is-active");
        });
    }
    $('.c-hamburger').on('click', function () {
        $(this).parents('.main-menu').toggleClass('open');
        $('body').toggleClass('menu-open');
    });
    $('html').on('click', function (e) {
        if ($(e.target).closest('.main-menu.open').length == 0) {
            $('.main-menu').removeClass('open');
            $('body').removeClass('menu-open');
            $('.c-hamburger').removeClass('is-active');
        }
    });
    // Readmore
    $('#readmore').readmore({
        moreLink: '<a href="#">' + label_read_full_story + '</a>',
        lessLink: '<a href="#">' + label_close_full_story + '</a>',
        collapsedHeight: 345,
        afterToggle: function (trigger, element, expanded) {
            if (!expanded) { // The "Close" link was clicked
                $('html, body').animate({scrollTop: element.offset().top}, {duration: 100});
            }
        }
    });

    // How to donate
    $('.faq-desc').hide();
    $('.list-faq li a').on('click', function (e) {
        e.preventDefault();
        $('.list-faq li a').not(this).next().slideUp().parent().removeClass('open');
        $(this).next().slideToggle().parent().addClass('open');
    });
});