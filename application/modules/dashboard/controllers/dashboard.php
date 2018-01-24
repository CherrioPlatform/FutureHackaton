<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('config', LANGUAGE);
        $this->load->model('dashboard_model');
    }

    /*
     * Loading dashboard subpages based on url
     * On main dashboard page we get Proof of Charity points
     * */
    public function index($param = null){
        $data['page_name'] = "";

        if($this->session->userdata('logged_in_site'))
        {
            $session_data = $this->session->userdata('logged_in_site');
            $data['user_data'] = json_decode($this->dashboard_model->user_data($session_data['id']))[0];

            if($param != null){
                switch ($param){
                    case "backed-campaigns":
                        $data['main_content'] = 'view_dashboard_backed_campaigns';
                        break;
                    case "active-campaigns":
                        $data['main_content'] = 'view_dashboard_active_campaigns';
                        break;
                    case "past-campaigns":
                        $data['main_content'] = 'view_dashboard_past_campaigns';
                        break;
                    case "profile":
                        $data['main_content'] = 'view_dashboard_profile';
                        break;
                    case "proof-of-charity":
                        $data['main_content'] = 'view_dashboard_proof_of_charity';
                        break;
                }
            }
            else{
                $user_points = json_decode($this->dashboard_model->get_poc_points($session_data['id']))[0];
                $data['user_points'] = $user_points;
                $data['main_content'] = 'view_dashboard';
            }
            $this->load->view('includes/template',$data);
        }
        else{
            header('Location: '.base_urll());
            die();
        }
    }

    /*
     * Get User's Backed Campaigns and calculate Proof of Charity points
     * */
    public function user_donations()
    {
        switch ($_POST['type']){
            case "backed_campaigns":
                $campaigns = json_decode($this->dashboard_model->get_campaigns());
                break;
        }
        if(empty($campaigns)){
            echo "false";
        }
        else{
            $data['campaigns'] = array();
            foreach ($campaigns as $campaign){
                $data['campaigns'][$campaign->id]['transactions'] = get_transactions($campaign->eth_address,$_POST['eth_address']);
            }
            $ether = 0;
            foreach ($data['campaigns'] as $index => $campaign) {
                foreach ($campaign['transactions'] as $i => $transaction) {
                    $ether += round($transaction->value,2);
                }
            }
            echo ($ether*ETH_CHR_CONVERSION) + $this->input->post('poc_points');
        }

    }

    /*
     * Populate table User's Backed Campaigns page
     * */
    public function campaign_tables()
    {
        if($this->session->userdata('logged_in_site'))
        {
            switch ($_POST['type']){
                case "backed_campaigns":
                    $campaigns = json_decode($this->dashboard_model->get_campaigns());
                    break;
            }
            if(empty($campaigns)){
                echo "false";
            }
            else{
                $data['campaigns'] = array();
                foreach ($campaigns as $campaign){
                    $data['campaigns'][$campaign->id]['transactions'] = get_transactions($campaign->eth_address,$_POST['eth_address']);
                    $data['campaigns'][$campaign->id]['campaign_details'] = $campaign;
                }
                $this->load->view('view_campaign_tables',$data);
            }
        }
    }

    /*
     * Populate table Proof of Chairty page
     * */
    public function proof_of_charity_table()
    {
        if($this->session->userdata('logged_in_site'))
        {
            $session_data = $this->session->userdata('logged_in_site');
            $data['share_acitvity'] = json_decode($this->dashboard_model->get_user_share_activity($session_data['id']));
            $data['hashtag_activity'] = json_decode($this->dashboard_model->get_user_hashtagectivity($session_data['id']));
            $campaigns = json_decode($this->dashboard_model->get_campaigns());
            $data['campaigns'] = array();
            foreach ($campaigns as $campaign){
                $data['campaigns'][$campaign->id]['transactions'] = get_transactions($campaign->eth_address,$_POST['eth_address']);
                $data['campaigns'][$campaign->id]['campaign_details'] = $campaign;
            }
            $this->load->view('view_proof_of_charity_table',$data);
        }
    }

    /*
     * Get Twitter oAuth
     * Get Twitter user details
     * Get User's hashtags, follow
     * */
    public function connect_with_twitter(){
        if($this->session->userdata('logged_in_site')) {
            $session_data = $this->session->userdata('logged_in_site');

            $userData = array();
            //Include the twitter oauth php libraries
            include_once APPPATH."libraries/twitter-oauth-php-codexworld/twitteroauth.php";
            //Twitter API Configuration
            $consumerKey = TWITTER_CONSUMER_KEY;
            $consumerSecret = TWITTER_CONSUMER_SECRET;
            $oauthCallback = base_urll().'twitter-auth/';

            //Get existing token and token secret from session
            $sessToken = $this->session->userdata('token');
            $sessTokenSecret = $this->session->userdata('token_secret');

            //Get status and user info from session
            $sessStatus = $this->session->userdata('status');
            $sessUserData = $this->session->userdata('userData');

            if(isset($sessStatus) && $sessStatus == 'verified'){
                //Connect and get latest tweets
                $connection = new TwitterOAuth($consumerKey, $consumerSecret, $sessUserData['accessToken']['oauth_token'], $sessUserData['accessToken']['oauth_token_secret']);
                $data['tweets'] = $connection->get('statuses/user_timeline', array('screen_name' => $sessUserData['username'], 'count' => 5));

                //User info from session
                $userData = $sessUserData;
            }elseif(isset($_GET['oauth_token']) && $sessToken == $_GET['oauth_token']){
                //Successful response returns oauth_token, oauth_token_secret, user_id, and screen_name
                $connection = new TwitterOAuth($consumerKey, $consumerSecret, $sessToken, $sessTokenSecret); //print_r($connection);die;
                $accessToken = $connection->getAccessToken($_GET['oauth_verifier']);
                if($connection->http_code == '200'){
                    //Get user profile info
                    $userInfo = $connection->get('account/verify_credentials');

                    //Preparing data for database insertion
                    $userData = array(
                        'oauth_provider' => 'twitter',
                        'oauth_uid' => $userInfo->id,
                        'username' => $userInfo->screen_name
                    );

                    // save twitter username
                    $this->dashboard_model->update_twitter_username($session_data['id'],$userInfo->screen_name);

                    //Store status and user profile info into session
                    $userData['accessToken'] = $accessToken;
                    $this->session->set_userdata('status','verified');
                    $this->session->set_userdata('userData',$userData);

                    //Get latest tweets
                    //	$data['tweets'] = $connection->get('statuses/user_timeline', array('screen_name' => $userInfo->screen_name, 'count' => 5));

                }else{
                    $data['error_msg'] = 'Some problem occurred, please try again later!';
                }
            }else{

                //unset token and token secret from session
                $this->session->unset_userdata('token');
                $this->session->unset_userdata('token_secret');

                //Fresh authentication
                $connection = new TwitterOAuth($consumerKey, $consumerSecret);
                $requestToken = $connection->getRequestToken($oauthCallback);

                //Received token info from twitter
                $this->session->set_userdata('token',$requestToken['oauth_token']);
                $this->session->set_userdata('token_secret',$requestToken['oauth_token_secret']);

                //Any value other than 200 is failure, so continue only if http code is 200
                if($connection->http_code == '200'){
                    //redirect user to twitter
                    $twitterUrl = $connection->getAuthorizeURL($requestToken['oauth_token']);

                    $data['oauthURL'] = $twitterUrl;
                    $response['status'] = "FALSE";
                    $response['url'] = $twitterUrl;
                    echo json_encode($response);

                }else{
                    $data['oauthURL'] = $oauthCallback;
                    $data['error_msg'] = 'Error connecting to twitter! try again later!';
                }
            }
            if(isset($userData["username"])){
                //	print_r($userData["username"]);
                $hashtags = json_encode($connection->get('statuses/user_timeline', array('screen_name' => $userData["username"], 'count' => 1000)));
                $following = json_encode($connection->get('friendships/show', array(
                    'source_screen_name' => $userData['username'],
                    'target_screen_name' => "CherrioPlatform",
                )));
                $following = json_decode($following);
                $follow = $following->relationship->target->followed_by;
                $follow_points = 0;
                if($follow){
                    $follow_points = 100;
                }
                $hashtags = json_decode($hashtags);
                $array_hashtags = array(
                    "cherrio" => 0
                );
                foreach ($hashtags as $hashtag) {
                    if(isset($hashtag->entities->hashtags)){
                        foreach ($hashtag->entities->hashtags as $hash) {
                            if(key_exists($hash->text, $array_hashtags)){
                                $array_hashtags[$hash->text] = $array_hashtags[$hash->text]+1;
                                break;
                            }
                        }
                    }
                }
                if(isset($_POST['type']) && $_POST['type'] == "hashtag"){
                    $response['status'] = "TRUE";
                    $response['hashtags'] = $array_hashtags;
                    $response['points'] = ($_POST['points'] + ($array_hashtags['cherrio']*25))+$follow_points;
                    $this->dashboard_model->update_twitter_user_hashtag($userData["username"], $array_hashtags['cherrio'], $follow);
                    echo json_encode($response);

                }
                else{
                    header('Location: '.base_urll()."dashboard");

                }
            }

        }
    }

    /*
     * Twitter Disconnect - kill the session
     * */
    public function twitter_logout() {
        $this->session->unset_userdata('token');
        $this->session->unset_userdata('token_secret');
        $this->session->unset_userdata('status');
        $this->session->unset_userdata('userData');
        header('Location: '.base_urll()."dashboard");
    }

}
