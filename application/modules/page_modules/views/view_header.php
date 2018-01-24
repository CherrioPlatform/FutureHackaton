<?php
$last = $this->uri->total_segments();
$record_num = $this->uri->segment($last);
$record_num_prelast = $this->uri->segment($last-1);
?>
<header id="header" class="site-header">
    <div class="container">
        <div class="site-brand">
            <a href="<?=base_url();?>"><img src="<?=base_url();?>img/logo-cherrio.svg" alt="Cherrio Logo"></a>
        </div>
        <div class="right-header">
            <nav class="main-menu">
                <button class="c-hamburger c-hamburger--htx"><span></span></button>
                <ul>
                    <li class="<?php echo ($record_num_prelast == "") ? "active" : ""?>">
                        <a href="<?=base_urll()?>">Campaigns</a>
                    </li>
                    <li class="<?php echo ($record_num_prelast == "past-campaigns") ? "active" : ""?>">
                        <a href="<?=base_urll()?>past-campaigns">Past Campaigns</a>
                    </li>
                    <li class="<?php echo ($record_num_prelast == "how-to-donate") ? "active" : ""?>">
                        <a href="<?=base_urll()?>how-to-donate">How to donate</a>
                    </li>
                    <li class="<?php echo ($record_num_prelast == "emergency-pool") ? "active" : ""?>">
                        <a href="<?=base_urll()?>emergency-pool">Emergency pool</a>
                    </li>
                    <li>
                        <a href="https://cherr.io">About CHERR.IO</a>
                    </li>
                    <li class="<?php echo ($this->uri->segment(0) == "dashboard") ? "active" : ""?>">
                        <?php
                        $session = get_session_data();
                        if($session){
                            ?>

                            <a href="<?=base_urll()?>dashboard">Account (<?= $session['firstname']?>)<i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            <ul class="sub-menu">
                                <li><a href="<?=base_urll()?>dashboard">Dashboard</a></li>
                                <li><a href="<?=base_urll()?>dashboard/backed-campaigns">Backed Campaigns</a></li>
                                <li><a href="<?=base_urll()?>dashboard/proof-of-charity">Proof of Charity</a></li>
                                <li><a href="<?=base_urll()?>login/logout">Logout</a></li>
                            </ul>
                            <?php
                        }
                        ?>
                    </li>
                </ul>
            </nav>
            <?php
            if(!$session){
                ?>
                <div class="login login-button">
                    <a href="<?=base_urll()?>login" class="btn-primary">Login</a>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</header>