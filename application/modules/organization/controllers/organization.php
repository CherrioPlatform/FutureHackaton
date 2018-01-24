<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Organization extends MX_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('config', LANGUAGE);
        $this->load->model('organization_model');
    }

    /*
     * Get and load view with organization's details
     * */
    public function index($param = null)
    {
        if($param != null){
            $resp = json_decode($this->organization_model->get_organisation(false,$param));
            $data['item'] = $resp[0];
            $data['main_content'] = 'view_organization';
        }
        else{
            header('Location: '.base_urll());
            die();
        }

        $this->load->view('includes/template', $data);
    }
}