<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        $this->lang->load('config', LANGUAGE);
        $this->load->model('login_model');
    }

    /*
     * Redirect to main page if user is logged in or load login page for unathorised users
     * */
    function index()
    {
        if($this->session->userdata('logged_in_site'))
        {
            $session_data = $this->session->userdata('logged_in_site');
            $data['username'] = $session_data['username'];
            header('Location: '.base_urll());
            die();
        }

        $this->load->helper(array('form'));
        $data['main_content'] = 'view_login';
        $this->load->view('includes/template',$data);
    }

    /*
     * Redirect to main page if user is logged in or load register page for unathorised users
     * */
    public function register()
    {
        if($this->session->userdata('logged_in_site'))
        {
            $session_data = $this->session->userdata('logged_in_site');
            $data['username'] = $session_data['username'];
            header('Location: '.base_urll());
            die();
        }

        $data['main_content'] = 'view_register';
        $this->load->view('includes/template',$data);
    }

    /*
     * Authorize and check user's login data
     * */
    public function login_form()
    {
        if(!$this->session->userdata('logged_in_site'))
        {
            $data = array();

            foreach ($_POST as $index => $item) {
                if($index != "id"){
                    switch ($index){
                        case "email":
                            $this->form_validation->set_rules($index,$index, 'trim|required|valid_email');
                            break;
                        case "password":
                            $this->form_validation->set_rules($index, $index, 'trim|required|xss_clean');
                            break;
                        default:
                            $this->form_validation->set_rules($index,$index, 'trim|required');
                            break;
                    }
                    $data[$index] = $item;

                }
            }
            if($this->form_validation->run() == FALSE){

                $errors = array();
                foreach ($this->input->post() as $key => $value)
                {
                    $errors[$key] = form_error($key);
                }
                $response['errors'] = array_filter($errors);
                $response['status'] = FALSE;
                header('Content-type: application/json');
                exit(json_encode($response));
            }
            else{

                $result = $this->login_model->login($this->input->post("email"), $this->input->post("password"));

                if(!$result){
                    $response['errors']["email"] = "<p>Incorrect email or password.</p>";
                    $response['status'] = FALSE;
                }
                else{

                    foreach($result as $row)
                    {
                        $sess_array = array(
                            'id' => $row->id,
                            'level' => $row->level,
                            'email' => $row->email,
                            'firstname' => $row->firstname,
                            'lastname' => $row->lastname,
                            'status' => TRUE
                        );

                        $this->session->set_userdata('logged_in_site', $sess_array);
                    }
                    $response['status'] = TRUE;
                }
                header('Content-type: application/json');
                exit(json_encode($response));
            }

        }
    }

    /*
     * Save registration in database
     * */
    public function save_registration()
    {
        $data = array();

        foreach ($_POST as $index => $item) {
            if($index != "id"){
                switch ($index){
                    case "email":
                        $this->form_validation->set_rules($index,$index, 'trim|required|valid_email');
                        break;
                    case "password":
                        $this->form_validation->set_rules($index, $index, 'trim|required|xss_clean');
                        break;
                    default:
                        $this->form_validation->set_rules($index,$index, 'trim|required');
                        break;
                }
                if($index != "password_confirm"){
                    $data[$index] = $item;
                }

            }
        }
        if($this->form_validation->run() == FALSE){

            $errors = array();
            foreach ($this->input->post() as $key => $value)
            {
                $errors[$key] = form_error($key);
            }
            $response['errors'] = array_filter(str_replace("_"," ",$errors));

            $response['status'] = FALSE;
            header('Content-type: application/json');
            exit(json_encode($response));
        }
        else{
            if(!is_address($data['eth_address'])){
                $response['errors']["eth_address"] = "<p>Please enter a valid ETH address.</p>";
                $response['status'] = FALSE;
            }else{
                if($this->input->post("password") != $this->input->post("password_confirm")){
                    $response['errors']["password"] = "<p>".t('password_doesnt_match')."</p>";
                    $response['errors']["password_confirm"] = "<p>".t('password_doesnt_match')."</p>";
                    $response['status'] = FALSE;
                }
                else{
                    $data['password'] = MD5($data['password']);
                    $hash = $this->login_model->save_registration($data);
                    if(!$hash){
                        $response['errors']["email"] = "<p>Email already exist</p>";
                        $response['status'] = FALSE;

                    }
                    else{
                        $this->send_email_new_user($data['email'], $hash, $data['firstname']);
                        $response['status'] = TRUE;
                    }
                }
            }

            header('Content-type: application/json');
            exit(json_encode($response));
        }
    }

    /*
     * Confirm registration via hash that has been sent on email
     * */
    public function confirm_registration($hash = null)
    {
        if($hash == null){
            header('Location: '.base_urll());
            die();
        }
        else{
            $resp = $this->login_model->check_hash_registration($hash);
            if($resp){
                $this->login_model->update_hash_register_status($hash);
                $data['main_content'] = 'view_registration_success';
                $data['hash'] = $hash;
                $this->load->view('includes/template',$data);
            }
            else{
                header('Location: '.base_urll());
                die();
            }
        }
    }

    /*
     * Forgotten password page. If hash is incorrect or expired, redirect user to homepage
     * */
    public function forgot_password($hash = null)
    {
        if($hash == null){
            $data['main_content'] = 'view_forgot_password';
            $this->load->view('includes/template',$data);
        }
        else{
            $resp = $this->login_model->check_hash($hash);
            if($resp){
                $data['main_content'] = 'view_new_password';
                $data['hash'] = $hash;
                $this->load->view('includes/template',$data);
            }
            else{
                header('Location: '.base_urll());
                die();
            }
        }
    }

    /*
     * Save new password
     * */
    public function update_password()
    {
        $data = array();
        foreach ($_POST as $index => $item) {
            if($index != "hash"){
                switch ($index){
                    case "email":
                        $this->form_validation->set_rules($index,$index, 'trim|required|valid_email');
                        break;
                    case "password":
                        $this->form_validation->set_rules($index, $index, 'trim|required|xss_clean');
                        break;
                    default:
                        $this->form_validation->set_rules($index,$index, 'trim|required');
                        break;
                }
                if($index != "password_confirm"){
                    $data[$index] = $item;
                }

            }
        }
        if($this->form_validation->run() == FALSE){

            $errors = array();
            foreach ($this->input->post() as $key => $value)
            {
                $errors[$key] = form_error($key);
            }
            $response['errors'] = array_filter(str_replace("_"," ",$errors));

            $response['status'] = FALSE;
            header('Content-type: application/json');
            exit(json_encode($response));
        }
        else{

            if($this->input->post("password") != $this->input->post("password_confirm")){
                $response['errors']["password"] = "<p>Password doesn't match.</p>";
                $response['errors']["password_confirm"] = "<p>Password doesn't match.</p>";
                $response['status'] = FALSE;
            }
            else{
                $resp = $this->login_model->check_hash($_POST['hash']);
                if($resp){
                    $obj = json_decode($resp);
                    $this->login_model->update_password(MD5($data['password']), $obj[0]->email, $_POST['hash']);
                    $response['status'] = TRUE;
                }
                else{
                    $response['errors']["email"] = "<p>".t('incorrect_hash')."</p>";
                    $response['status'] = FALSE;
                }
            }
            header('Content-type: application/json');
            exit(json_encode($response));
        }
    }

    /*
     * Logout usser - unset session
     * */
    function logout()
    {
        $this->session->unset_userdata('logged_in_site');
        redirect('login', 'refresh');
    }
    public function contact_us_form()
    {
        $data = array();
        foreach ($_POST as $index => $item) {
            if($index != "id"){
                switch ($index){
                    case "email":
                        $this->form_validation->set_rules($index,$index, 'trim|required|valid_email');
                        break;
                    case "message":
                        break;
                    default:
                        $this->form_validation->set_rules($index,$index, 'trim|required');
                        break;
                }
                $data[$index] = $item;

            }
        }
        if($this->form_validation->run() == FALSE){

            $errors = array();
            foreach ($this->input->post() as $key => $value)
            {
                $errors[$key] = form_error($key);
            }
            // $response['errors'] = array_filter($errors);
            $response['errors']["email"] = "<p>".t('email_required')."</p>";

            $response['status'] = FALSE;
            header('Content-type: application/json');
            exit(json_encode($response));
        }
        else{
            $resp = $this->login_model->save_forgot_password_hash($data);

            if(!$resp){
                $response['errors']["email"] = "Email doesn't exist</p>";
                $response['status'] = FALSE;
            }
            else{
                $response['status'] = TRUE;
                $this->send_email($data['email'], $resp);
            }

            header('Content-type: application/json');
            exit(json_encode($response));
        }
    }

    /*
     * Send email to newly registered users
     * */
    public function send_email_new_user($email, $hash, $name)
    {
        $email_content = "Dear {name}, <br>";
        $email_content .= "<br>thank you for registering to the CHERR.IO platform.<br><br>In order to complete your registration, please click the confirmation link below:";
        $email_content .= "<br>".base_urll()."confirm-registration/".$hash;
        $email_content .= "<br><br>CHERR.IO Team<br>";

        $reciver_email = array(
            $email
        );
        $find = array(
            "{name}"
        );

        $replace = array(
            $name
        );
        $email_message = str_replace($find, $replace, $email_content);

        send_email($email_message, $reciver_email,"CHERR.IO - Confirm your registration");
    }

    /*
     * Send email for password reset
     * */
    public function send_email($email, $hash) {
        $email_content = "You requested to reset your password.<br><br>Click here to reset password: ".base_urll()."forgot-password/".$hash;
        $email_content .= "<br><br>CHERR.IO Team<br>";

        $reciver_email = array(
            $email
        );

        $find = array();
        $replace = array();

        $email_message = str_replace($find, $replace, $email_content);

        send_email($email_message, $reciver_email,"CHERR.IO - Reset password");
    }
}