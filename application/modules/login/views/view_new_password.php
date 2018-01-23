<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>
    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">New password</h1>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="main-content">
                <div class="form-login">
                    <h2>Enter new password</h2>
                    <form id="subscribeForm" method="post" class="clearfix">
                        <input type="hidden" name="hash" value="<?=$hash?>"/>
                        <div class="field">
                            <input type="password" name="password" id="password" placeholder="New password" />
                        </div>
                        <div class="field">
                            <input type="password" name="password_confirm" id="password_confirm" placeholder="Confirm new password" />
                        </div>
                        <p class='error-message'></p>
                        <p class='success-message'></p>
                        <div class="inline clearfix">
                            <button type="submit" class="btnSaveNewPassword btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>