<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>
    <?php

    ?>
    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Register</h1>
                <hr>
            </div>
        </div>
        <div class="container">
            <div class="main-content">
                <div class="form-login form-register">
                    <h2>Register account</h2>
                    <form method="POST" id="registerForm" class="clearfix">
                        <div class="field">
                            <input type="text" name="firstname" id="firstname" placeholder="First name" />
                        </div>
                        <div class="field">
                            <input type="text" name="lastname" id="lastname" placeholder="Last name" />
                        </div>
                        <div class="field">
                            <input type="email" name="email" id="email" placeholder="E-mail" />
                        </div>
                        <div class="field">
                            <input type="text" name="eth_address" id="eth_address" placeholder="ETH Wallet Address (Rinkeby Testnet)" />
                        </div>
                        <div class="field">
                            <input type="password" name="password" id="password" placeholder="Password" />
                        </div>
                        <div class="field">
                            <input type="password" name="password_confirm" id="password_confirm" placeholder="Confirm password" />
                        </div>
                        <div class="inline clearfix">
                            <button type="submit" value="Send Messager" class="btnRegister btn-primary">Register</button>
                            <p>Already a member? <a href="<?=base_urll()?>login">Login now</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>

