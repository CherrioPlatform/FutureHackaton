<?php

class Dashboard_model extends CI_Model {
    public function user_data($user_id, $nice_url = false)
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
    public function get_poc_points($user_id)
    {
        $this->db->select("proof_of_charity.id, SUM(proof_of_charity_type.points) AS poc_points");
        $this -> db -> from('proof_of_charity');
        $array_where = array(
            "proof_of_charity.user_id" => $user_id,
            "proof_of_charity.status_id" => 1
        );
        $this -> db -> where($array_where);

        $this->db->join('proof_of_charity_type', 'proof_of_charity_type.id = proof_of_charity.proof_of_charity_type_id', "RIGHT");

        $query = $this -> db -> get();
        //var_dump($this->db->last_query());
        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        else{
            return false;
        }
    }
    public function get_campaigns($status_id = false, $type_id = 10)
    {
        $this -> db -> select('page_content.id, page_content.title, page_content.sub_title, page_content.eth_address, page_content.nice_url, campaign_type.nice_url AS campaign_type_nice_url, page_content.goal, type.nice_url AS type_nice_url, status.name AS status_name');
        $this->db->select("DATE_FORMAT(page_content.datetime, '%d. %m. %Y') AS datetime", FALSE);

        $this->db->join('type', 'type.id = page_content.type_id');
        $this->db->join('status', 'status.id = page_content.status_id');
        $this->db->join('campaign_type', 'campaign_type.id = page_content.campaign_type_id', "LEFT");


        $this -> db -> from('page_content');
        $array_where = array(
            "page_content.type_id" => $type_id
        );
        if($status_id){
            if($status_id != -1){
                $array_where["page_content.status_id"] = $status_id;
            }
            else{
                $this -> db -> where("page_content.status_id != 1");
            }
        }
        $this -> db -> where($array_where);

        $query = $this -> db -> get();

        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        return json_encode(array());
        //var_dump($this->db->last_query());
    }
    public function update_twitter_user_hashtag($twitter_username, $sum, $follow)
    {
        $data = array(
            'twitter_user_hashtags' => $sum,
            'twitter_page_follow' => $follow,
        );
        $this->db->where('twitter_user_id', $twitter_username);
        $this->db->update('users', $data);
    }
    public function update_twitter_username($id,$username)
    {
        $data = array(
            'twitter_user_id' => $username
        );
        $this->db->where('id', $id);
        $this->db->update('users', $data);
    }
    public function get_user_share_activity($user_id)
    {
        $this->db->select("proof_of_charity.id, proof_of_charity_type.points AS poc_points, page_content.nice_url,campaign_type.nice_url AS campaign_type_nice_url, type.nice_url AS type_nice_url, page_content.title");
        $this->db->select("DATE_FORMAT(proof_of_charity.datetime, '%d. %m. %Y') AS datetime", FALSE);

        $this -> db -> from('proof_of_charity');
        $array_where = array(
            "proof_of_charity.user_id" => $user_id,
            "proof_of_charity.status_id" => 1
        );
        $this -> db -> where($array_where);

        $this->db->join('page_content', 'page_content.id = proof_of_charity.page_content_id',"LEFT");
        $this->db->join('type', 'type.id = page_content.type_id',"LEFT");
        $this->db->join('campaign_type', 'campaign_type.id = page_content.campaign_type_id', "LEFT");
        $this->db->join('proof_of_charity_type', 'proof_of_charity_type.id = proof_of_charity.proof_of_charity_type_id', "RIGHT");

        $query = $this -> db -> get();
        //var_dump($this->db->last_query());
        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        else{
            return false;
        }
    }
    public function get_user_hashtagectivity($user_id)
    {
        $this->db->select("twitter_user_hashtags, twitter_page_follow");

        $this -> db -> from('users');
        $array_where = array(
            "users.id" => $user_id
        );
        $this -> db -> where($array_where);

        $query = $this -> db -> get();
        //var_dump($this->db->last_query());
        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        else{
            return false;
        }
    }
}