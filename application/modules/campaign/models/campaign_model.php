<?php

class Campaign_model extends CI_Model {
    public function return_campaign($type_id = null, $lang = LANGUAGE, $order = 'page_content.datetime', $asc_desc = "DESC", $popular = false)
    {
        $this -> db -> select('page_content.id,page_content.title,,page_content.sub_title,page_content.description, page_content.duration_datetime, 
        page_content.short_description,page_content.short_description, page_content.goal, page_content.duration, page_content.eth_address, 
        page_content.other_text4, page_content.nice_url, type.name AS type_name, page_content.alias, type.nice_url AS type_nice_url, 
        campaign_type.name AS campaign_type_name, page_content.status_id AS page_status, campaign_type.nice_url AS campaign_type_nice_url,
        campaign_type.img AS campaign_icon, users.avatar_img, users.firstname AS organisation_firstname, users.lastname AS organisation_lastname, 
        users.nice_url AS organisation_nice_url');

        $this->db->select("DATE_FORMAT(page_content.datetime, '%d. %m. %Y') AS datetime", FALSE);
        $this -> db -> from('page_content');

        $array_where = array(
            "language.short_name" => $lang,
            "page_content.status_id" => 1,
        );
        $this->db->join('language', 'language.id = page_content.language_id');
        $this->db->join('type', 'type.id = page_content.type_id');
        $this->db->join('campaign_type', 'campaign_type.id = page_content.campaign_type_id');
        $this->db->join('users', 'users.id = page_content.organisation_id');

        $this->db->join('page_content_views', 'page_content_views.page_content_id = page_content.id',"LEFT");
        $this -> db -> select("COUNT(page_content_views.page_content_id) AS page_views");
        $this->db->group_by("page_content.id");

        if($popular){
            $this->db->order_by("page_views", "DESC");
        }

        if($type_id != null){
            $array_where["page_content.type_id"] = $type_id;
        }
        else{
            $this -> db -> where("(page_content.type_id = 16)");
        }
        $this -> db -> where($array_where);

        $this -> db -> order_by($order,$asc_desc);
        $query = $this -> db -> get();
       //  var_dump($this->db->last_query());
        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        else{
           return false;
        }
    }
    public function campaign_by_niceurl($nice_url = false, $campaign_type_nice_url = false,  $order = 'page_content.datetime', $asc_desc = "DESC", $status_id = 1)
    {
        $this -> db -> select('page_content.id,page_content.title,page_content.sub_title,page_content.description, page_content.duration_datetime, page_content.short_description,page_content.location,page_content.short_description, page_content.goal, 
        page_content.duration, page_content.eth_address, page_content.other_text4, page_content.nice_url, type.name AS type_name, page_content.alias,
        type.nice_url AS type_nice_url, campaign_type.name AS campaign_type_name, campaign_type.nice_url AS campaign_type_nice_url, campaign_type.img AS campaign_icon, users.avatar_img, users.firstname AS organisation_firstname, 
        users.lastname AS organisation_lastname, users.nice_url AS organisation_nice_url, page_content.status_id AS page_status');
        $this->db->select("DATE_FORMAT(page_content.datetime, '%d. %m. %Y') AS datetime", FALSE);
        $this->db->join('page_content_views', 'page_content_views.page_content_id = page_content.id',"LEFT");
        $this -> db -> from('page_content');

        if($campaign_type_nice_url){
            $array_where = array(
                "campaign_type.nice_url" => $campaign_type_nice_url
            );
        }
        else if($nice_url){
            $array_where = array(
                "page_content.nice_url" => $nice_url
            );
        }
        else{
            $array_where = array(
                "page_content.status_id" => $status_id
            );
        }


        $this->db->join('type', 'type.id = page_content.type_id',"LEFT");
        $this->db->join('page_content_rating', 'page_content_rating.page_content_id = page_content.id',"LEFT");
        $this->db->join('campaign_type', 'campaign_type.id = page_content.campaign_type_id', "LEFT");
        $this->db->join('users', 'users.id = page_content.organisation_id');

        $this -> db -> where("page_content.status_id != 4");
        $this -> db -> where($array_where);
        $this -> db -> order_by($order,$asc_desc);

        $query = $this -> db -> get();

        return json_encode($query -> result());
    }
    public function campaign_updates($nice_url)
    {
        $this -> db -> select('campaign_updates.id, page_content.title, campaign_updates.text, campaign_updates.status_id');
        $this->db->select("DATE_FORMAT(campaign_updates.datetime, '%d. %m. %Y %h:%i:%s') AS datetime", FALSE);
        $this -> db -> from('campaign_updates');
        $this->db->join('page_content', 'page_content.id = campaign_updates.page_content_id');
        $array_where = array(
            "page_content.nice_url" => $nice_url,
            "campaign_updates.status_id" => 1,
        );
        $this->db->where($array_where);

        $this -> db -> order_by("campaign_updates.datetime", "DESC");

        $query = $this -> db -> get();
        //  var_dump($this->db->last_query());
        return json_encode($query -> result());
    }
    public function page_media($product_id, $type_id = null, $data_type_id = null) //$type_id 3 = image, $type_id 4 = video, $type_id 5 = audio, $type_id 6 = document // $data_type_id 1 = cover_img, $data_type_id 8 = thumbnail, 7 = main image
    {
        $this -> db -> select('media_element.path, media_element.description, media_element.title');
        $this -> db -> from('media');
        $array_where = array(
            "media.type_id" => 10,
            "media.status_id" => 1,
            "media_element.status_id" => 1,
            "media.page_content_id" => $product_id
        );
        if($data_type_id != null){
            $array_where['media_element.data_type_id'] = $data_type_id;
        }
        if($type_id != null){
            $array_where['media_element.type_id'] = $type_id;
        }
        $this -> db -> where($array_where);
        $this->db->join('media_element', 'media_element.media_id = media.id');

        $query = $this->db->get();
        //  var_dump($this->db->last_query());
        return json_encode($query->result());
    }
    public function update_campaign_status($id)
    {
        $data = array(
            'status_id' => 10
        );
        $this->db->where('id', $id);
        $this->db->update('page_content', $data);
    }
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
}