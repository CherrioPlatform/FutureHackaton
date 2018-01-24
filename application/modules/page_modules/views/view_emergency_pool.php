<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Emergency pool</h1>
                <hr>
            </div>
        </div>

        <div class="emergency-pool-section flat-map">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <?
                            $pool_address = "0xDF2127C553D833bb2e54E96b344E7E63a159aEC5";
                        ?>
                        <h2 class="title"><?=round(get_pool_balance($pool_address),4)?> ETH in Emergency pool</h2>
                        <br>
                        <div class="text-center">
                            <?php
                            if(!ETH_TESTNET)
                                $etherscan = "https://rinkeby.etherscan.io/address/".$pool_address;
                            else
                                $etherscan = "https://rinkeby.etherscan.io/address/".$pool_address;
                            ?>
                            <a href="<?=$etherscan?>" class="btn-primary" target="_blank">Check on Etherscan</a>
                        </div>
                        <br><br>
                        <div id="particles-js"></div>
                    </div>
                </div>
            </div>
        </div>

    </main>

</div>
<?php echo Modules::run('page_modules/footer'); ?>