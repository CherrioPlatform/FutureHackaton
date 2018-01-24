<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Generate small menu on Campaign details
 * */
if ( ! function_exists('page_small_menu'))
{
    function page_small_menu($menu_type,$item) {
        $ci =& get_instance();

        ?>
        <li><a href="<?=base_urll()?>">Home</a><span>/</span></li>
        <?php
        switch ($menu_type){
            case "campaign-details":
                ?>
                <li><a href="<?=base_urll().$ci->uri->segment(0)?>"><?=$item->type_name?></a><span>/</span></li>
                <li><a href="<?=base_urll().$item->type_nice_url.'/'.$item->campaign_type_nice_url?>"><?=$item->campaign_type_name?></a><span>/</span></li>
                <li><?=$item->sub_title?></li> /
                <?php
                break;
            case "campaigns":
                ?>
                <li><a><?=$item->type_name?></a></li>
                <?php
                break;
            case "campaign-type":
                ?>
                <li><a href="<?=base_urll().$item->type_nice_url?>"><?=$item->type_name?></a><span>/</span></li>
                <li><a href="<?=base_urll().$item->type_nice_url.'/'.$item->campaign_type_nice_url?>"><?=$item->campaign_type_name?></a></li>
                <?php
                break;
            case "past-campaigns":
                ?>
                <li><a>Past Campaigns</a></li>
                <?php
                break;
        }
    }
}

/*
 * Small campaign box info
 * */
if ( ! function_exists('campaign_box'))
{
    // Load campaigns
    function campaign_box($item,$img) {

        $ci =& get_instance();

        $user_alias = "";
        if($ci->session->userdata('logged_in_site'))
        {
            $session_data = $ci->session->userdata('logged_in_site');
            $data['user_data'] = json_decode($ci->campaign_model->user_data($session_data['id']))[0];
            $user_alias =  "/".$item->alias.$data['user_data']->alias;
        }

        $raised = round(get_balance($item->eth_address),4);
        $first_segment = $ci->uri->segment(0);
        $first_segment = (empty($first_segment)) ? $item->type_nice_url : $ci->uri->segment(0);

        $url = base_urll().$first_segment.'/'.$item->campaign_type_nice_url.'/'.$item->nice_url.$user_alias;
        $campaign_type_url = base_urll().$item->type_nice_url.'/'.$item->campaign_type_nice_url;
        $organisation_url = base_urll().'organization/'.$item->organisation_nice_url;

        $show = true;
        if($raised >= $item->goal && $item->page_status == 1){
            $ci->campaign_model->update_campaign_status($item->id);
            $show = false;
        }
        if($show){
            ?>
            <div class="col-lg-4 col-sm-6">
                <div class="campaign-item">
                    <a class="overlay" href="<?=$url?>">
                        <div class="campaign-icon-2" style="background-image: url(<?php echo CONST_IMG_URL.$item->campaign_icon;?>);"></div>
                        <?php
                        if(isset($img[0]->path)){
                            ?>
                            <img src="<?php echo CONST_IMG_URL.$img[0]->path;?>" alt="<?php echo $img[0]->title;?>"  title="<?php echo $img[0]->title;?>" >
                            <?php
                        }
                        ?>
                        <span class="ion-ios-search-strong"></span>
                    </a>
                    <div class="campaign-box">
                        <a href="<?=$campaign_type_url?>" class="category"><?=$item->campaign_type_name?></a>
                        <h3><a href="<?=$url?>"><?=$item->title?></a></h3>
                        <hr>
                        <div class="campaign-description"><?=truncate($item->short_description,115)?></div>
                        <div class="campaign-author"><a class="author-icon" href="<?=$organisation_url?>"><img src="<?=CONST_IMG_URL.$item->avatar_img;?>"  alt=""></a>by <a class="author-name" href="<?=$organisation_url?>"><?=$item->organisation_firstname. " ". $item->organisation_lastname;?></a></div>
                        <div class="process">

                            <div class="raised"><span style="width:<?=progress_procentage($item->goal,$raised)?>%"><div class="arrow_box"><?=progress_procentage($item->goal,$raised)?>%</div></span></div>
                            <div class="process-info">
                                <div class="process-pledged"><span><?=$item->goal?> ETH</span>Goal</div>
                                <div class="process-funded"><span><?=$raised?> ETH</span>Funded</div>

                                <?
                                $days_till = days_till($item->duration_datetime, false);
                                if($days_till != 0 && ($raised < $item->goal)){
                                    ?>
                                    <div class="process-time" data-time="<?=$item->duration_datetime?>"><span><?=$days_till?></span> End time</div>
                                    <?php
                                }
                                else{
                                    ?>
                                    <div class="process-finished">
                                        <a class="btn-primary btn-finished">Finished</a>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
    }
}

/*
 * List of campaign donations
 * */
if ( ! function_exists('campaign_transactions'))
{
    function campaign_transactions($eth, $address, $timestamp) {

        if(!ETH_TESTNET)
            $etherscan_address = "https://etherscan.io/address/".$address;
        else
            $etherscan_address = "https://rinkeby.etherscan.io/address/".$address;
        ?>
        <div class="plan">
            <a href="<?=$etherscan_address?>" target="_blank">
                <h4><?=round($eth,4)?> ETH</h4>
                <div class="plan-date"><?= days_till(date('Y-m-d H:i:s', $timestamp));?> ago</div>
                <div class="backer"><?=$address?></div>
            </a>
        </div>
        <?php
    }
}