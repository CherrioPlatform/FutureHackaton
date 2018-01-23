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
                        <div class="account-content backed-campaigns account-table">
                            <h3 class="account-title">My Backed Campaigns</h3>
                            <div class="account-main">
                                <div class="table-container">
                                    <table>
                                        <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Date</th>
                                            <th>Goal</th>
                                            <th>Donated</th>
                                            <th>Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <div class="spinner"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        </tbody>

                                    </table>
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
                "eth_address" : "<?=$user_data->eth_address?>"
            };
            jQuery.ajax({
                type: "POST",
                url: base_urll +"dashboards/campaign_tables",
                data: data,
                success: function(resp) {
                    // console.log(resp);
                    if(resp == "false"){
                        $(".table-container").html("No campaigns.");
                    }
                    else{
                        $("tbody").html(resp);
                    }
                }
            });
        }
    });
</script>