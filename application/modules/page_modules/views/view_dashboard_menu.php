<?php

$last = $this->uri->total_segments();
$record_num = $this->uri->segment($last);
$record_num_prelast = $this->uri->segment($last-1);
?>
<nav class="account-bar">
    <ul>
        <li class="<?php echo ($record_num_prelast == "dashboard") ? "active" : ""?>"><a href="<?=base_urll()?>dashboard">Dashboard</a></li>
        <li class="<?php echo ($record_num_prelast == "backed-campaigns") ? "active" : ""?>"><a href="<?=base_urll()?>dashboard/backed-campaigns">Backed campaigns</a></li>
        <li class="<?php echo ($record_num_prelast == "proof-of-charity") ? "active" : ""?>"><a href="<?=base_urll()?>dashboard/proof-of-charity">Proof of Charity</a></li>
    </ul>
</nav>