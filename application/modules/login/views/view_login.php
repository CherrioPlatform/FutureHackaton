<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>
    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Login</h1>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="main-content">
                <div class="form-login">
                    <h2>Log in with your account</h2>
                    <form id="login_form" method="post" class="clearfix">
                        <div class="field">
                            <input type="email" name="email" id="email" placeholder="E-mail Address" />
                        </div>
                        <div class="field">
                            <input type="password" name="password" id="password" placeholder="Password" />
                        </div>
                        <div class="field">
                            <div class="g-recaptcha" data-sitekey="6LeYAUEUAAAAAJh3FiAE0D6LVntm_-xCDYqr1Xwh"></div>
                        </div>
                        <p class='error-message'></p>
                        <p class='success-message'></p>
                        <div class="inline clearfix">
                            <button type="submit" class="btnLogin btn-primary">Login</button>
                            <p>Not a member yet? <a href="<?=base_urll()?>register">Register now</a></p>
                            <div class="clearfix"></div>
                            <p class="forgot-password">Forgotten password? <a href="<?=base_urll()?>forgot-password">Reset password</a>.</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>

