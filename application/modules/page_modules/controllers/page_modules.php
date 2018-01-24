<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Page_modules extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('page_modules_model');
    }
    public function index(){}

    /*
     * Load header view
     * */
    public function header($data = null)
    {
        $this->load->view('view_header',$data);
    }

    /*
     * Load footer view
     * */
    public function footer()
    {
        $this->load->view('view_footer');
    }

    /*
     * Load dashboard menu
     * */
    public function dashboard_menu()
    {
        $this->load->view('view_dashboard_menu');
    }

    /*
     * Load How to donate view
     * */
    public function how_to_donate()
    {
        $data['main_content'] = 'view_how_to_donate';
        $this->load->view('includes/template',$data);
    }

    /*
     * Load Emergency pool view
     * */
    public function emergency_pool()
    {
        $data['main_content'] = 'view_emergency_pool';
        $this->load->view('includes/template',$data);
    }
    
}
