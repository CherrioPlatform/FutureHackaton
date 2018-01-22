<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->lang->load('config', LANGUAGE);
        $this->load->model('global_model');
        $this->load->model('main_model');
    }
    public function index(){
        $data['main_content'] = 'view_main';
        $this->load->view('includes/template',$data);
    }

}

