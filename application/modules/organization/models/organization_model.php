<?php

class Organization_model extends CI_Model {
    public function get_organisation($user_id, $nice_url = false)
    {
        $this->db->select("users.firstname, users.lastname,users.alias,users.email, users.eth_address, users.website, users.phone, users.mobile, users.city, users.post_number, users.country, users.address, users.about_us, users.avatar_img");
        $this->db->select("DATE_FORMAT(users.datetime, '%d. %m. %Y') AS datetime", FALSE);
        $this -> db -> from('users');
        if($user_id){
            $array_where = array(
                "users.id" => $user_id,
            );
        }
        if($nice_url){
            $array_where["users.nice_url"] = $nice_url;
        }
        $this -> db -> where($array_where);

        $query = $this -> db -> get();
        //   var_dump($this->db->last_query());
        return json_encode($query -> result());
    }
}