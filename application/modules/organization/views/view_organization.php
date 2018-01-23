
<div id="wrapper">
    <?php echo Modules::run('page_modules/header'); ?>

    <main id="main" class="site-main">
        <div class="page-title background-page">
            <div class="container">
                <h1 class="text-center">Organization details</h1>
                <hr>
            </div>
        </div>
        <div class="account-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="account-content profile">
                            <h3 class="account-title">Organization details</h3>
                            <div class="account-main">
                                <div class="author clearfix">
                                    <a class="author-avatar"><img src="<?=CONST_IMG_URL.$item->avatar_img?>" alt=""></a>
                                    <div class="author-content organization-content">
                                        <div class="author-title"><h3><a><?=$item->firstname?> <?=$item->lastname?></a></h3></div>
                                        <div class="author-info">
                                            <p><a href="mailto:<?=$item->email?>"><?=$item->email?></a></p>
                                            <p>Member since <?=$item->datetime?></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="profile-box">
                                    <ul>
                                        <li>
                                            <strong>About us:</strong>
                                            <div class="profile-text"><p><?=$item->about_us?></p></div>
                                        </li>
                                        <li>
                                            <strong>Website:</strong>
                                            <div class="profile-text"><a href="<?=$item->website?>" target="_blank"><?=$item->website?></a></div>
                                        </li>
                                        <li>
                                            <strong>Mobile:</strong>
                                            <div class="profile-text"><p><?=$item->mobile?></p></div>
                                        </li>
                                        <li>
                                            <strong>Phone:</strong>
                                            <div class="profile-text"><p><?=$item->phone?></p></div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="profile-box">
                                    <h3>Address</h3>
                                    <ul>
                                        <li>
                                            <strong>Organization:</strong>
                                            <div class="profile-text"><p><?=$item->firstname?> <?=$item->lastname?></p></div>
                                        </li>
                                        <li>
                                            <strong>Address:</strong>
                                            <div class="profile-text"><p><?=$item->address?></p></div>
                                        </li>
                                        <li>
                                            <strong>City:</strong>
                                            <div class="profile-text"><p><?=$item->city?></p></div>
                                        </li>
                                        <li>
                                            <strong>Postcode:</strong>
                                            <div class="profile-text"><p><?=$item->post_number?></p></div>
                                        </li>
                                        <li>
                                            <strong>Country:</strong>
                                            <div class="profile-text"><p><?=$item->country?></p></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <?php echo Modules::run('page_modules/footer'); ?>
</div>
