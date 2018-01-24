<?php

class Login_model extends CI_Model
{

    /*
     * Return user's data on login
     * */
    function login($email, $password)
    {
        $this -> db -> select('id, password, email,level, firstname, lastname, nice_url');
        $this -> db -> from('users');
        $this -> db -> where('email', $email);
        $this -> db -> where('password', MD5($password));
        $array_where = array(
            "active" => 1,
            "status_id" => 1
        );
        $this -> db -> where("(level = 1 OR level = 7)");
        $this -> db -> where($array_where);
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() == 1)
        {
            return $query->result();
        }
        else
        {
            return false;
        }
    }

    /*
     * Generate user's alias (random)
     * */
    public function get_random_text($length = 5) {
        $alias = substr(str_shuffle('AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'), 0, $length);
        return $this->CheckUserAlias($alias);
    }

    /*
     * Check if user's alias already exist
     * */
    public function CheckUserAlias($alias)
    {
        $this -> db -> select('alias');
        $this -> db -> from('users');

        $array_where = array(
            'alias' => $alias
        );
        $this -> db -> where($array_where);

        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() > 0)
        {
            return $this->get_random_text(5);
        }
        else
        {
            return $alias;
        }
    }

    /*
     * Update user's password
     * */
    public function update_password($password, $email, $hash)
    {
        $data = array(
            'password' => $password
        );
        $this->db->where('email', $email);
        $this->db->update('users', $data);
        $this->update_hash_status($hash);
        return true;

    }

    /*
     * Check if forgotten password hash is correct
     * */
    public function check_hash($hash)
    {
        $this -> db -> select('id, email');
        $this -> db -> from('users_forgot_password');
        $array_where = array(
            'hash' => $hash,
            'status_id' => 1
        );
        $this -> db -> where($array_where);
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() > 0)
        {
            return json_encode($query->result());
        }
        else
        {
            return false;
        }
    }

    /*
     * Check if user's registeration confirmation link has correct hash
     * */
    public function check_hash_registration($hash)
    {
        $this -> db -> select('id, email');
        $this -> db -> from('users');
        $array_where = array(
            'hash' => $hash,
            'status_id' => 5
        );
        $this -> db -> where($array_where);
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() > 0)
        {
            return json_encode($query->result());
        }
        else
        {
            return false;
        }
    }

    /*
     * Set hash's status to approved (registration)
     * */
    public function update_hash_register_status($hash)
    {
        $data = array(
            'status_id' => 1
        );
        $this->db->set('datetime_confirm', 'NOW()', FALSE);
        $this->db->where('hash', $hash);
        $this->db->update('users', $data);
        return true;
    }

    /*
     * Set hash's status to approved (forgotten password)
     * */
    public function update_hash_status($hash)
    {
        $data = array(
            'status_id' => 2
        );
        $this->db->set('datetime_confirm', 'NOW()', FALSE);
        $this->db->where('hash', $hash);
        $this->db->update('users_forgot_password', $data);
        return true;
    }

    /*
     * Save new users at registration
     * */
    public function save_registration($data)
    {
        if(!$this->check_email_exist($data['email'])){
            $user_alias = $this->get_random_text(5);
            $data['hash'] = MD5($this->get_random_text(10));
            $data['alias'] = $user_alias;
            $data['status_id'] = 5;
            $this->db->set('datetime', 'NOW()', FALSE);
            $this->db->set('datetime_ut', 'UTC_TIMESTAMP()', FALSE);
            $this->db->insert('users', $data);
            return $data['hash'];
        }
        return false;
    }

    /*
     * Save forgotten password hash
     * */
    public function save_forgot_password_hash($data)
    {
        $email = $data['email'];
        if($this->check_email_exist($email)){
            $data['hash'] = MD5($this->get_random_text(10));
            $data['email'] = $email;
            $this->db->insert('users_forgot_password', $data);
            return $data['hash'];
        }
        else{
            return false;
        }
    }

    /*
     * Check if user's email exists
     * */
    public function check_email_exist($email, $id = null){
        $this -> db -> select('id');
        $this -> db -> from('users');
        if($id == null)
            $this -> db -> where('email', $email);
        else{
            $array_where = array(
                'email' => $email,
                'id !=' => $id
            );
            $this -> db -> where($array_where);
        }
        $this -> db -> limit(1);

        $query = $this -> db -> get();

        if($query -> num_rows() > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}


