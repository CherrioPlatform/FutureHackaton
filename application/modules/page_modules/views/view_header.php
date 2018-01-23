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
                    <li class="<?php echo ($record_num_prelast == "past-campaigns") ? "active" : ""?>">
                        <a href="<?=base_urll()?>past-campaigns">Past Campaigns</a>
                    </li>
                    <li>
                        <a href="https://cherr.io">About CHERR.IO</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>