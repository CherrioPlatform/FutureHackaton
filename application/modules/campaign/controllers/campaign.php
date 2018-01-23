<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Campaign extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('config', LANGUAGE);
        $this->load->model('campaign_model');
    }
    public function index(){
        $data['page_name'] = "home";
        $data['campaign'] = json_decode($this->campaign_model->return_campaign(10));

        $data['main_content'] = 'view_main';
        $this->load->view('includes/template',$data);
    }
    public function campaigns($param1 = null, $param2 = null, $param3 = null)
    {
           if($param3 != null){
                  $this->r($param3, false);
              }

              $data['page_name'] = "campaign-detail";
              $data['fb_share'] = true;
              $data['logged_in'] = false;
              $data['share_url'] = base_url().LANGUAGE.uri_string();

              if($param2 != null){
                  $resp = json_decode($this->campaign_model->campaign_by_niceurl($param2));

                  $campaign_updates = json_decode($this->campaign_model->campaign_updates($param2));

                  $data['item'] = $resp[0];
                  $data['campaign_updates'] = $campaign_updates;

                  if($this->session->userdata('logged_in_site'))
                  {
                      $session_data = $this->session->userdata('logged_in_site');
                      $data['user_data'] = json_decode($this->campaign_model->GetUserData($session_data['id']))[0];
                      $data['logged_in'] = true;
                      if($param3 == null){
                          $url = base_urll().$data['item']->type_nice_url.'/'.$data['item']->campaign_type_nice_url.'/'.$data['item']->nice_url."/".$data['item']->alias.$data['user_data']->alias;
                          header('Location: '.$url);
                          die();
                      }
                      else if($param3 != $data['item']->alias.$data['user_data']->alias){
                          $url = base_urll().$data['item']->type_nice_url.'/'.$data['item']->campaign_type_nice_url.'/'.$data['item']->nice_url."/".$data['item']->alias.$data['user_data']->alias;
                          header('Location: '.$url);
                          die();
                      }
                  }
                  else if($param3 != null){
                      $url = base_urll().$data['item']->type_nice_url.'/'.$data['item']->campaign_type_nice_url.'/'.$data['item']->nice_url;
                      header('Location: '.$url);
                      die();
                  }
                  $data['menu_type'] = "campaign-details";
                  $data['main_content'] = 'view_campaign_details';
                  $this->load->view('includes/template',$data);
              }
              else{
                  if($param1 != null){
                      $data['page_name'] = "home";

                      $data['campaign'] = json_decode($this->campaign_model->campaign_by_niceurl(false,$param1));
                      if(empty($data['campaign'])){
                          header('Location: '.base_urll());
                          die();
                      }
                      $data['item'] = $data['campaign'][0];
                      $data['page_title'] = $data['item']->campaign_type_name;
                      $data['menu_type'] = "campaign-type";

                      $data['main_content'] = 'view_campaign_grid';
                      $this->load->view('includes/template',$data);
                  }
                  else{
                      $data['page_name'] = "home";

                      $data['campaign'] = json_decode($this->campaign_model->campaign_by_niceurl());

                      if(empty($data['campaign'])){
                          header('Location: '.base_urll());
                          die();
                      }
                      $data['item'] = $data['campaign'][0];
                      $data['page_title'] = $data['item']->type_name;
                      $data['menu_type'] = "campaigns";

                      $data['main_content'] = 'view_campaign_grid';
                      $this->load->view('includes/template',$data);
                  }

              }
    }

    public function past_campaign()
    {
        $data['page_name'] = "home";

        $data['campaign'] = json_decode($this->campaign_model->campaign_by_niceurl($nice_url = false, $campaign_type_nice_url = false,  $order = 'page_content.datetime', $asc_desc = "DESC", $status_id = 10));

        if(empty($data['campaign'])){
            $data['main_content'] = 'view_no_campaigns';
        }
        else{
            $data['page_title'] = "Past Campaigns";
            $data['menu_type'] = "past-campaigns";
            $data['item'] = $data['campaign'][0];
            $data['main_content'] = 'view_campaign_grid';

        }

        $this->load->view('includes/template',$data);
    }

}