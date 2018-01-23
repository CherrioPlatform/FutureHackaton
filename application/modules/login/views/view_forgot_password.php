<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>
    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Forgotten password</h1>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="main-content">
                <div class="form-login">
                    <h2>Enter your email</h2>
                    <form id="subscribeForm" method="post" class="clearfix">
                        <div class="field">
                            <input type="email" name="email" id="email" placeholder="E-mail address" />
                        </div>
                        <p class='error-message'></p>
                        <p class='success-message'></p>
                        <div class="inline clearfix">
                            <button type="submit" class="btnForgotPassword btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>