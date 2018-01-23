<?php
$i = 0;
foreach ((array)$campaigns as $index => $campaign) {
    foreach ($campaign['transactions'] as $i => $transaction) {
        $url = base_urll().$campaign['campaign_details']->type_nice_url.'/'.$campaign['campaign_details']->campaign_type_nice_url.'/'.$campaign['campaign_details']->nice_url;
        //var_dump($transaction->value);
        $i = 1;
        ?>
        <tr>
            <td  class="poc-icon"><img src="<?=base_url()?>img/icons/ethereum-icon.png"/></td>
            <td><a target="_blank" href="<?=$url?>">Donation | <?=round($transaction->value,2)?> ETH</a></td>
            <td><?=round($transaction->value,2)*ETH_CHR_CONVERSION?></td>
            <td><?= date('d. m. Y', $transaction->timeStamp); ?></td>
        </tr>
        <?php
    }
}
foreach ((array)$share_acitvity as $share_acitvit){
    $url = base_urll().$share_acitvit->type_nice_url.'/'.$share_acitvit->campaign_type_nice_url.'/'.$share_acitvit->nice_url;
    $i = 1;
    ?>
    <tr>
        <td class="poc-icon"><img src="<?=base_url()?>img/icons/click-icon.png"/> </td>
        <td> <a href="<?=$url?>" target="_blank">Share | <?= truncate($share_acitvit->title,20); ?></a></td>
        <td><?=$share_acitvit->poc_points;?></td>
        <td><?=$share_acitvit->datetime;?></td>
    </tr>
    <?php
}
foreach ((array)$hashtag_activity as $hashtag_activit){
    if($hashtag_activit->twitter_user_hashtags > 0){
        $i = 1;
        ?>
        <tr>
            <td class="poc-icon"><img src="<?=base_url()?>img/icons/hashtag-icon.png"/> </td>
            <td>Twitter hashtag | #cherrio (<?=$hashtag_activit->twitter_user_hashtags;?>)</td>
            <td><?=($hashtag_activit->twitter_user_hashtags*25);?></td>
            <td>/</td>
        </tr>
        <?php
    }
    if($hashtag_activit->twitter_page_follow == 1){
        $i = 1;
        ?>
        <tr>
            <td class="poc-icon"><img src="<?=base_url()?>img/icons/hashtag-icon.png"/> </td>
            <td>Twitter follow </td>
            <td>100</td>
            <td>/</td>
        </tr>
        <?php
    }
}
if($i == 0){
    ?>
    <tr>
        <td></td>
        <td>No activity.</td>
        <td></td>
        <td></td>
    </tr>
    <?php
}
?>