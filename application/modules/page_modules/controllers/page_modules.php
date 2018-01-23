<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Page_modules extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('page_modules_model');
    }
    public function index(){}

    public function header($data = null)
    {
        $this->load->view('view_header',$data);
    }
    public function footer()
    {
        $this->load->view('view_footer');
    }
}
