
<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">My account</h1>
                <hr>
            </div>
        </div>
        <div class="account-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <?php echo Modules::run('page_modules/dashboard_menu'); ?>
                    </div>
                    <div class="col-lg-9">
                        <div class="account-content dashboard">
                            <h3 class="account-title">Dashboard</h3>
                            <div class="account-main">
                                <div class="author clearfix">
                                    <div class="author-content">
                                        <div class="author-title"><h3><a><?=$user_data->firstname ?> <?=$user_data->lastname ?></a></h3><a style="display: none" class="edit-profile" href="#">Edit profile</a></div>
                                        <div class="author-info">
                                            <p><a href="mailto:<?=$user_data->email ?>"><?=$user_data->email ?></a></p>
                                            <p>Member since <?= $user_data->datetime?></p>
                                        </div>
                                        <div class="author-info">
                                            <p class="twitter_btn"></p>
                                        </div>
                                        <a href="<?=base_urll()?>dashboard/proof-of-charity" class="proof-of-charity-points"><span class="poc_points counter" data-count="0"><div class="spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div></span><div class="label-proof-of-charity-points">POC Points</div></a>
                                    </div>
                                </div>
                                <div class="payment-info">
                                    <p>ETH Wallet Address: <br><?=$user_data->eth_address ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>
<script>
    jQuery(document).ready(function($){
       LoadTable();

        function LoadTable(){
            var data = {
                "type" : "backed_campaigns",
                "eth_address" : "<?=$user_data->eth_address?>",
                "poc_points" : "<?=$user_points->poc_points?>"
            };
            jQuery.ajax({
                type: "POST",
                url: base_urll +"dashboards/user_donations",
                data: data,
                success: function(resp) {
                    GetTwitterOauth(resp);

                }
            });
        }
        function GetTwitterOauth(resp_points){
            var data = {
                "type" : "hashtag",
                "points" : resp_points
            };
            jQuery.ajax({
                type: "POST",
                url: base_urll +"dashboards/connect_with_twitter",
                data: data,
                success: function(resp) {
                    var obj = jQuery.parseJSON(resp);
                    if(obj.status == "TRUE"){
                        // $(".poc_points").html(obj.points);
                        $(".poc_points").html(0);
                        $('.poc_points').attr('data-count', obj.points);
                        $(".twitter_btn").html('<div class="btn-primary btn-twitter btn-eth btn-disabled"><i class="tw-icon"></i> Connected with Twitter</div>');
                    }
                    else{
                        $(".poc_points").html(0);
                        $('.poc_points').attr('data-count', resp_points);
                        $(".twitter_btn").html('<a href="'+obj.url+'"class="twitter_connect"><div class="btn-primary btn-twitter btn-eth"><i class="tw-icon"></i> Connect with Twitter account</div></a>');
                    }
                    CountUP();
                }
            });
        }
        // POC points counter animate
        function CountUP() {
            //COUNT UP
            $('.counter').each(function () {
                var $this = $(this),
                    countTo = $this.attr('data-count');
                $({countNum: $this.text()}).animate({
                        countNum: countTo
                    },
                    {
                        duration: 2000,
                        easing: 'linear',
                        step: function () {
                            $this.text(Math.floor(this.countNum));
                        },
                        complete: function () {
                            $this.text(this.countNum);
                            //alert('finished');
                        }
                    });
            });
        }
    });
</script>