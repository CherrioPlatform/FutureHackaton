<?php
$i = 0;
foreach ($campaigns as $index => $campaign) {
    foreach ($campaign['transactions'] as $i => $transaction) {
        //var_dump($transaction->value);
        $url = base_urll().$campaign['campaign_details']->type_nice_url.'/'.$campaign['campaign_details']->campaign_type_nice_url.'/'.$campaign['campaign_details']->nice_url;
        $i = 1;
        ?>
        <tr>
            <td><a href="<?=$url?>" target="_blank"><?=$campaign['campaign_details']->title?></a></td>
            <td><?= date('d. m. Y', $transaction->timeStamp); ?></td>
            <td><?=$campaign['campaign_details']->goal; ?></td>
            <td><?=round($transaction->value,2)?> ETH</td>
            <td><?=$campaign['campaign_details']->status_name?></td>
        </tr>
        <?php
    }
}
if($i == 0){
    ?>
    <tr>
        <td>You don't have any backed campaigns. Back a campaign <a class="inline" href="<?=base_urll()?>campaigns">now</a>.</td>
        <td></td>
        <td>
        </td>
        <td></td>
        <td></td>
    </tr>
    <?php
}
?>