<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>
    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Successful registration</h1>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="main-content">
                <div class="form-login">
                    Your registration was successful. You can now <a href="<?=base_urll()?>login" style="display: inline; text-decoration: underline;">login</a>.
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>