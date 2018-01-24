<?php
$organisation_url = base_urll().'organization/'.$item->organisation_nice_url;
$campaign_type_url = base_urll().$item->type_nice_url.'/'.$item->campaign_type_nice_url;
$raised = round(get_balance($item->eth_address),4);
$donations = (get_number_of_donators($item->eth_address));

if($raised >= $item->goal && $item->page_status == 1){
    $this->campaign_model->update_campaign_status($item->id);
}

?>
<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1>
                    <?=$item->sub_title?>
                </h1>
                <hr>
                <div class="breadcrumbs">
                    <ul>
                        <?
                        page_small_menu($menu_type,$item);
                        ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="campaign-content">
            <div class="container">
                <div class="campaign">
                    <div class="campaign-item clearfix">
                        <?php
                        $img = json_decode($this->campaign_model->page_media($item->id, null,9));
                        if(isset($img[0]->path)){
                            ?>
                            <div class="campaign-image">
                                <div id="owl-campaign" class="campaign-slider">
                                    <?php
                                    $img = json_decode($this->campaign_model->page_media($item->id, null,9));
                                    foreach ($img as $value){
                                        ?>
                                        <div class="item"><img src="<?php echo CONST_IMG_URL.$value->path;?>" alt="<?php echo $value->title;?>" title="<?php echo $value->title;?>" ></div>
                                        <?php
                                    }
                                    ?>
                                </div>
                            </div>
                            <?php
                        }
                        ?>
                        <div class="campaign-box">
                            <a href="<?=$campaign_type_url?>"><div class="campaign-icon-1" style="background-image: url(<?php echo CONST_IMG_URL.$item->campaign_icon;?>);"></div></a>
                            <a href="<?=base_urll().$item->type_nice_url.'/'.$item->campaign_type_nice_url?>" class="category"><?=$item->campaign_type_name?></a>
                            <h3><?=$item->sub_title;?></h3>
                            <div class="campaign-description"><p><?=$item->short_description;?></p></div>
                            <div class="campaign-author clearfix">
                                <div class="author-profile">
                                    <a class="author-icon" href="<?=$organisation_url?>"><img src="<?=CONST_IMG_URL.$item->avatar_img;?>"></a>by <a class="author-name" href="<?=$organisation_url?>"><?=$item->organisation_firstname. " ". $item->organisation_lastname;?></a>

                                </div>
                                <div class="author-address"><span class="ion-location"></span><?=$item->location;?></div>
                            </div>
                            <div class="process">
                                <div class="raised"><span style="width:<?=progress_procentage($item->goal,$raised)?>%"><div class="arrow_box"><?=progress_procentage($item->goal,$raised)?>%</div></span></div>
                                <div class="process-info clearfix">
                                    <div class="process-funded"><span><?=$raised?> / <?=$item->goal?> ETH</span>Goal</div>
                                    <div class="process-time"><span><?=$donations?></span>Donations</div>
                                    <div class="process-time" data-time="<?=$item->duration_datetime?>"><span><?=days_till($item->duration_datetime, false)?></span>End time</div>
                                </div>
                            </div>
                            <div class="button">
                                <?php
                                if($item->page_status == 1 && $raised < $item->goal){
                                    if($this->session->userdata('logged_in_site'))
                                    {
                                        ?>
                                        <button data-toggle="modal" data-target="#myModal" class="btn-primary btn-eth" type="submit"><i class="eth-icon"></i>Donate now</button>
                                        <div id="myModal" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title"><?=$item->title;?></h4>
                                                    </div>
                                                    <div class="modal-body" style="text-align: center">
                                                        <p>Send ETH to this address: <br><br><b><span class="unique-eth-address eth-address"><?=trim($item->eth_address)?></span></b></p>
                                                        <p>
                                                            <img src="https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=<?=trim($item->eth_address)?>&choe=UTF-8" title="<?=trim($item->eth_address)?>" />
                                                        </p>
                                                        <p class="color-red">I agree that my donation can be transfered to <a href="<?=base_urll()?>emergency-pool" target="_blank">Emergency pool</a> in case of false proof of spent funds.</p>
                                                        <br>
                                                        <div class="text-center"><a href="<?=base_urll()?>how-to-donate" style="text-decoration: underline">How can I donate?</a></div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                    else{
                                        ?>
                                        <button data-toggle="modal" data-target="#myModalLogin" class="btn-primary btn-eth"><i class="eth-icon"></i>Donate now</button>
                                        <div id="myModalLogin" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title"><?=$item->title;?></h4>
                                                    </div>
                                                    <div class="modal-body" style="text-align: center">
                                                        <p>For a donation please login.</p>
                                                        <br>
                                                        <a href="<?=base_urll()?>login" class="btn-primary">Login</a>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                }
                                else{
                                    ?>
                                    <div class="btn-primary">Campaign finished</div>
                                    <?php
                                       if(isset($user_data) && $user_data->user_id == $item->organisation_id){
                                           ?>
                                           <button data-toggle="modal" data-target="#myModalDoc" class="btn-primary btn-documents" type="submit"><i class="doc-icon"></i> Upload documents</button>
                                           <div id="myModalDoc" class="modal fade" role="dialog">
                                               <div class="modal-dialog">
                                                   <div class="modal-content">
                                                       <div class="modal-header">
                                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                           <h4 class="modal-title"><?=$item->title;?></h4>
                                                       </div>
                                                       <div class="modal-body" style="text-align: center; padding: 50px 0">
                                                           <p>Upload documents (.jpg, .png, .jpeg):</p>
                                                           <br><br>

                                                           <input type="hidden" name="campaign_id"  id="campaign_id" value="<?=$item->id?>"/>
                                                           <input type="hidden" name="organisation_id" value="<?=$item->organisation_id?>"/>
                                                           <form action="post" id="form_media_upload" class="dropzone">
                                                               <div class="fallback">
                                                                   <input name="file" type="file" multiple />
                                                               </div>
                                                           </form>

                                                           <button type="button" class="btn btn-default btnMediaUpload btn-dark">Upload</button>
                                                       </div>
                                                       <div class="modal-footer">
                                                           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                       </div>
                                                   </div>
                                               </div>
                                           </div>
                                           <?php
                                       }
                                    ?>
                                    <?php
                                        if(isset($item->proof_image) && $item->proof_image != NULL){
                                            ?>
                                            <div class="uploaded-docs">
                                                <ul>
                                                    <li><a target="_blank" href="<?= base_url()?>mvp_cms/campaigns/<?=$item->proof_image?>" class="document-icon"></a></li>
                                                </ul>
                                            </div>
                                            <?php
                                                if(isset($user_data) && $user_data->user_id != $item->organisation_id){

                                                    ?>
                                                    <input type="hidden" id="campaign_address" value="<?=trim($item->eth_address)?>"/>

                                                    <div class="vote-docs"></div>
                                                    <?php
                                                }
                                            ?>
                                            <?php
                                        }
                                    ?>
                                    <?php
                                }
                                ?>

                            </div>
                            <div class="share">
                                <p>Share this campaign</p>
                                <ul>
                                    <li class="share-facebook"><a class="btnShareArticleFB"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li  class="share-twitter">
                                        <a class="share-twitter"
                                           href="https://twitter.com/intent/tweet?hashtags=cherrio&text=<?php echo $item->title;?>&url=<?=$share_url;?>"
                                           data-size="large">
                                            <i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    </li>
                                </ul>
                                <?php
                                if(!$this->session->userdata('logged_in_site')){
                                    ?>
                                    <div class="rewarding-system">Participate in <a href="<?=base_urll()?>how-to-donate">Proof Of Charity</a> by sharing this campaign. <a href="<?=base_urll()?>login">Login now</a>.</div>
                                    <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .campaign-content -->
        <div class="campaign-history">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="campaign-tabs support-campaign">
                            <h3 class="support-campaign-title">Full story</h3>
                            <hr>
                            <div class="campaign-content">
                                <div id="campaign" class="tabs active">
                                    <div id="readmore">
                                        <p>
                                            <?=$item->description;?>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="campaign-content" id="comments">
                                <h3 class="support-campaign-title">Comments</h3>
                                <hr>
                                <div class="fb-comments" data-href="<?=current_url();?>" data-width="100%" data-numposts="10"></div>
                            </div>
                        </div>
                    </div><!-- .main-content -->
                    <div class="col-lg-4">
                        <div class="support support-campaign">
                            <h3 class="support-campaign-title">Latest donations</h3>
                            <hr>
                            <?php
                            $i = 0;
                            if($item->eth_address != NULL){
                                $transactions = get_transactions($item->eth_address);
                                foreach ($transactions as $transaction){
                                    campaign_transactions($transaction->value, $transaction->from, $transaction->timeStamp);
                                    $i = 1;
                                }
                            }
                            if($i == 0){
                                echo "Be first to donate.";
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<?php echo Modules::run('page_modules/footer'); ?>