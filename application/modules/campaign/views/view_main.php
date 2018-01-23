
<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="latest-campaigns campaign">
            <div class="container">
                <h2 class="title">Active campaigns</h2>
                <hr>
                <h4 class="description">Help us raise enough money to save human lives!</h4>
                <div class="campaign-content">
                    <div class="row">
                        <?php
                        foreach ((array)$campaign as $item) {
                            $img = json_decode($this->campaign_model->page_media($item->id, null,8));
                            campaign_box($item,$img);
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </main>

</div>

<?php echo Modules::run('page_modules/footer'); ?>