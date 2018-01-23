<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="campaign-detail">
            <div class="page-title background-page">
                <div class="container">
                    <h1>
                        <?=$page_title?>
                    </h1>
                    <hr>
                    <div class="breadcrumbs">
                        <ul>
                            <?
                                page_small_menu($menu_type,$item);
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="latest-campaigns">
            <div class="container">
                <div class="campaign-content">
                    <div class="row">
                        <?php
                        foreach ($campaign as $item) {
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