<?php

class Campaign_model extends CI_Model {

    /*
     * Return all campaigns
     * */
    public function return_campaign($type_id = null, $lang = LANGUAGE, $order = 'page_content.datetime', $asc_desc = "DESC", $popular = false)
    {
        $this -> db -> select('page_content.id,page_content.title,,page_content.sub_title,page_content.description, page_content.duration_datetime, 
        page_content.short_description,page_content.short_description, page_content.goal, page_content.duration, page_content.eth_address, 
        page_content.other_text4, page_content.nice_url, type.name AS type_name, page_content.alias, type.nice_url AS type_nice_url, 
        campaign_type.name AS campaign_type_name, page_content.status_id AS page_status, campaign_type.nice_url AS campaign_type_nice_url,
        campaign_type.img AS campaign_icon, users.avatar_img, users.firstname AS organisation_firstname, users.email, users.lastname AS organisation_lastname, 
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

    /*
     * Return campaign details by nice url
     * */
    public function campaign_by_niceurl($nice_url = false, $campaign_type_nice_url = false, $order = 'page_content.datetime', $asc_desc = "DESC", $status_id = 1)
    {
        $this -> db -> select('page_content.id,page_content.title,page_content.sub_title,page_content.description, page_content.duration_datetime, page_content.short_description,
        page_content.location,page_content.short_description, page_content.goal, page_content.duration, page_content.eth_address, page_content.other_text4, page_content.nice_url, 
        type.name AS type_name, page_content.alias, type.nice_url AS type_nice_url, campaign_type.name AS campaign_type_name, campaign_type.nice_url AS campaign_type_nice_url, 
        campaign_type.img AS campaign_icon, users.id AS organisation_id, users.avatar_img, users.firstname AS organisation_firstname, users.lastname AS organisation_lastname, 
        users.email, users.nice_url AS organisation_nice_url, page_content.status_id AS page_status, page_content.proof_image');
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
       // var_dump($this->db->last_query());
        return json_encode($query -> result());
    }

    /*
     * Return campaign's media
     * $type_id 3 = image,
     * $data_type_id 1 = cover_img,
     * $data_type_id 8 = thumbnail,
     * 7 = main image
     * */
    public function page_media($product_id, $type_id = null, $data_type_id = null) {
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

    /*
     * When campaign finished, update its' status
     * */
    public function update_campaign_status($id)
    {
        $data = array(
            'status_id' => 10
        );
        $this->db->where('id', $id);
        $this->db->update('page_content', $data);
    }

    /*
     * Returns user or organization details
     * */
    public function user_data($user_id, $nice_url = false)
    {
        $this->db->select("users.firstname, users.level, users.id AS user_id, users.lastname,users.alias,users.email, users.eth_address, users.website, users.phone, users.mobile, users.city, users.post_number, users.country, users.address, users.about_us, users.avatar_img");
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

    /*
     * Save Proof of charity activity
     * */
    public function save_proof_of_charity($user_id, $campaign_id)
    {
        if(!$this->check_ip_and_datetime($user_id,$campaign_id)){
            $data = array(
                "user_id" => $user_id,
                "page_content_id" => $campaign_id,
                "click_from_ip" => REMOTE_ADDR_IP,
                "url" => current_url(),
                "request_method" => json_encode($_SERVER)
            );
            $this->db->set('datetime', 'NOW()', FALSE);
            $this->db->set('datetime_utc', 'UTC_TIMESTAMP()', FALSE);

            $this->db->insert('proof_of_charity', $data);
        }
    }

    /*
     * Security check if Proof of Charity activity was already applied on current day
     * */
    public function check_ip_and_datetime($user_id, $page_content_id)
    {
        $this->db->select("proof_of_charity.id");
        $this -> db -> from('proof_of_charity');
        $array_where = array(
            "proof_of_charity.click_from_ip" => REMOTE_ADDR_IP,
            "proof_of_charity.user_id" => $user_id,
            "proof_of_charity.page_content_id" => $page_content_id,
        );

        $this -> db -> where($array_where);
        $this->db->where('DATE(datetime) = DATE(NOW())');

        $query = $this -> db -> get();
        //var_dump($this->db->last_query());
        if($query -> num_rows() > 0){
            return json_encode($query -> result());
        }
        else{
            return false;
        }

    }

    /*
     * Get campaign and user details by alias
     * */
    public function check_short_url($alias)
    {
        $this -> db -> select('page_content.id,page_content.title,page_content.sub_title,page_content.description, page_content.short_description, 
        page_content.duration_datetime,page_content.location,page_content.short_description, page_content.goal, page_content.duration, 
        page_content.eth_address, page_content.other_text4, page_content.nice_url, type.name AS type_name, page_content.alias, type.nice_url AS type_nice_url, 
        campaign_type.name AS campaign_type_name, campaign_type.nice_url AS campaign_type_nice_url, campaign_type.img AS campaign_icon, 
        users.avatar_img, users.firstname AS organisation_firstname, users.email, users.lastname AS organisation_lastname, users.nice_url AS organisation_nice_url');
        $this->db->select("DATE_FORMAT(page_content.datetime, '%d. %m. %Y') AS datetime", FALSE);
        $this->db->join('page_content_views', 'page_content_views.page_content_id = page_content.id',"LEFT");
        $this -> db -> from('page_content');

        $array_where = array(
            "page_content.alias" => $alias
        );

        $this->db->join('type', 'type.id = page_content.type_id',"LEFT");
        $this->db->join('page_content_rating', 'page_content_rating.page_content_id = page_content.id',"LEFT");
        $this->db->join('campaign_type', 'campaign_type.id = page_content.campaign_type_id', "LEFT");
        $this->db->join('users', 'users.id = page_content.organisation_id');

        $this -> db -> where($array_where);

        $query = $this -> db -> get();

        return json_encode($query -> result());

    }

    /*
     * Check if user alias exists
     * */
    public function check_user_alias($alias)
    {
        $this->db->select("users.id, users.alias");
        $this -> db -> from('users');
        $array_where = array(
            "users.alias" => $alias,
        );

        $this -> db -> where($array_where);

        $query = $this -> db -> get();
        //   var_dump($this->db->last_query());
        return json_encode($query -> result());
    }

    /*
     * Upload Proof of spent funds documents
     * */
    public function MediaUpload() {
        $allowedExts = array("jpg", "jpeg", "gif", "png");
        $extension = strtolower(end(explode(".", $_FILES["file"]["name"])));

        if (in_array($extension, $allowedExts)) {
            if ($_FILES["file"]["error"] == 0) {

                $upload_path_thumb = CONST_MEDIA_UPLOAD_URL."thumb/";
                $file_nicename = $this->niceImageName($_FILES["file"]["name"]);
                $file = $this->GenerateUniqueFileName($file_nicename, CONST_MEDIA_UPLOAD_URL,0,$file_nicename);

                $uploadedfile = CONST_MEDIA_UPLOAD_URL.$file;

                move_uploaded_file($_FILES["file"]["tmp_name"], $uploadedfile);

                $config['image_library'] = 'gd2';
                $config['source_image']	= $uploadedfile;
                $config['new_image'] = $upload_path_thumb.$file;
                $config['maintain_ratio'] = TRUE;
                $config['width'] = 500;
                $config['height'] = '1';
                $config['master_dim'] = 'width';

                $this->load->library('image_lib', $config);

                $this->image_lib->resize();

                $data = array(
                    "proof_image" => $file
                );
                $this->db->where('id', $this->input->post("campaign_id"));
                $this->db->update('page_content', $data);

            }
        }
    }

    /*
     * Generates unique filename of Proof of spent funds
     * */
    public function GenerateUniqueFileName($file, $path, $i = 0, $original_filename, $cropped_image = false){
        if (file_exists($path.$file)) {
            $file = $original_filename;
            $i++;
            $file_array = explode(".",$file);
            $new_file = '';
            for($k = 0; $k < count($file_array); $k++){
                if($k == 0)
                    $new_file .= $file_array[$k];
                else
                    $new_file .= '.'.$file_array[$k];
                if($k == count($file_array)-2){
                    if($cropped_image)
                        $new_file .= '_cropped_'.$i;
                    else
                        $new_file .='_'.$i;
                }
            }
            return $this->GenerateUniqueFileName($new_file, CONST_MEDIA_UPLOAD_URL,$i,$original_filename,$cropped_image);
        }
        return $file;
    }

    /*
     * Generates nice image name
     * */
    public function niceImageName($str, $replace=array(), $delimiter='-', $options = array(), $table = null,$element_id = null) {

        if( !empty($replace) ) {
            $str = str_replace((array)$replace, ' ', $str);
        }
        $array_sumniki_find = array('č','š','ž','ć','đ', 'ü');
        $array_sumniki_replace = array('c','s','z','c','d','u');
        $str = str_replace($array_sumniki_find, $array_sumniki_replace, $str);
        $str = str_replace((array)$replace, ' ', $str);
        // Make sure string is in UTF-8 and strip invalid UTF-8 characters
        $str = mb_convert_encoding((string)$str, 'UTF-8', mb_list_encodings());

        $defaults = array(
            'delimiter' => '',
            'limit' => null,
            'lowercase' => true,
            'replacements' => array(),
            'transliterate' => false,
        );

        // Merge options
        $options = array_merge($defaults, $options);

        $char_map = array(
            // Latin
            'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A', 'Æ' => 'AE', 'Ç' => 'C',
            'È' => 'E', 'É' => 'E', 'Ê' => 'E', 'Ë' => 'E', 'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I',
            'Ð' => 'D', 'Ñ' => 'N', 'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'O', 'Ő' => 'O',
            'Ø' => 'O', 'Ù' => 'U', 'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U', 'Ű' => 'U', 'Ý' => 'Y', 'Þ' => 'TH',
            'ß' => 'ss',
            'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a', 'ä' => 'a', 'å' => 'a', 'æ' => 'ae', 'ç' => 'c',
            'è' => 'e', 'é' => 'e', 'ê' => 'e', 'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i',
            'ð' => 'd', 'ñ' => 'n', 'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o', 'ö' => 'o', 'ő' => 'o',
            'ø' => 'o', 'ù' => 'u', 'ú' => 'u', 'û' => 'u', 'ü' => 'u', 'ű' => 'u', 'ý' => 'y', 'þ' => 'th',
            'ÿ' => 'y',

            // Latin symbols
            '©' => '(c)',

            // Greek
            'Α' => 'A', 'Β' => 'B', 'Γ' => 'G', 'Δ' => 'D', 'Ε' => 'E', 'Ζ' => 'Z', 'Η' => 'H', 'Θ' => '8',
            'Ι' => 'I', 'Κ' => 'K', 'Λ' => 'L', 'Μ' => 'M', 'Ν' => 'N', 'Ξ' => '3', 'Ο' => 'O', 'Π' => 'P',
            'Ρ' => 'R', 'Σ' => 'S', 'Τ' => 'T', 'Υ' => 'Y', 'Φ' => 'F', 'Χ' => 'X', 'Ψ' => 'PS', 'Ω' => 'W',
            'Ά' => 'A', 'Έ' => 'E', 'Ί' => 'I', 'Ό' => 'O', 'Ύ' => 'Y', 'Ή' => 'H', 'Ώ' => 'W', 'Ϊ' => 'I',
            'Ϋ' => 'Y',
            'α' => 'a', 'β' => 'b', 'γ' => 'g', 'δ' => 'd', 'ε' => 'e', 'ζ' => 'z', 'η' => 'h', 'θ' => '8',
            'ι' => 'i', 'κ' => 'k', 'λ' => 'l', 'μ' => 'm', 'ν' => 'n', 'ξ' => '3', 'ο' => 'o', 'π' => 'p',
            'ρ' => 'r', 'σ' => 's', 'τ' => 't', 'υ' => 'y', 'φ' => 'f', 'χ' => 'x', 'ψ' => 'ps', 'ω' => 'w',
            'ά' => 'a', 'έ' => 'e', 'ί' => 'i', 'ό' => 'o', 'ύ' => 'y', 'ή' => 'h', 'ώ' => 'w', 'ς' => 's',
            'ϊ' => 'i', 'ΰ' => 'y', 'ϋ' => 'y', 'ΐ' => 'i',

            // Turkish
            'Ş' => 'S', 'İ' => 'I', 'Ç' => 'C', 'Ü' => 'U', 'Ö' => 'O', 'Ğ' => 'G',
            'ş' => 's', 'ı' => 'i', 'ç' => 'c', 'ü' => 'u', 'ö' => 'o', 'ğ' => 'g',

            // Russian
            'А' => 'A', 'Б' => 'B', 'В' => 'V', 'Г' => 'G', 'Д' => 'D', 'Е' => 'E', 'Ё' => 'Yo', 'Ж' => 'Zh',
            'З' => 'Z', 'И' => 'I', 'Й' => 'J', 'К' => 'K', 'Л' => 'L', 'М' => 'M', 'Н' => 'N', 'О' => 'O',
            'П' => 'P', 'Р' => 'R', 'С' => 'S', 'Т' => 'T', 'У' => 'U', 'Ф' => 'F', 'Х' => 'H', 'Ц' => 'C',
            'Ч' => 'Ch', 'Ш' => 'Sh', 'Щ' => 'Sh', 'Ъ' => '', 'Ы' => 'Y', 'Ь' => '', 'Э' => 'E', 'Ю' => 'Yu',
            'Я' => 'Ya',
            'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'g', 'д' => 'd', 'е' => 'e', 'ё' => 'yo', 'ж' => 'zh',
            'з' => 'z', 'и' => 'i', 'й' => 'j', 'к' => 'k', 'л' => 'l', 'м' => 'm', 'н' => 'n', 'о' => 'o',
            'п' => 'p', 'р' => 'r', 'с' => 's', 'т' => 't', 'у' => 'u', 'ф' => 'f', 'х' => 'h', 'ц' => 'c',
            'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sh', 'ъ' => '', 'ы' => 'y', 'ь' => '', 'э' => 'e', 'ю' => 'yu',
            'я' => 'ya',

            // Ukrainian
            'Є' => 'Ye', 'І' => 'I', 'Ї' => 'Yi', 'Ґ' => 'G',
            'є' => 'ye', 'і' => 'i', 'ї' => 'yi', 'ґ' => 'g',

            // Slovenia
            'Š' => 's', 'Ž' => 'z', 'Č' => 'c', 'Ć' => 'c', 'š' => 's',
            'ž' => 'z', 'č' => 'c', 'ć' => 'c','đ' => 'd', 'Đ' => 'D',

            // Czech
            'Č' => 'C', 'Ď' => 'D', 'Ě' => 'E', 'Ň' => 'N', 'Ř' => 'R', 'Š' => 'S', 'Ť' => 'T', 'Ů' => 'U',
            'Ž' => 'Z',
            'č' => 'c', 'ď' => 'd', 'ě' => 'e', 'ň' => 'n', 'ř' => 'r', 'š' => 's', 'ť' => 't', 'ů' => 'u',
            'ž' => 'z',

            // Polish
            'Ą' => 'A', 'Ć' => 'C', 'Ę' => 'e', 'Ł' => 'L', 'Ń' => 'N', 'Ó' => 'o', 'Ś' => 'S', 'Ź' => 'Z',
            'Ż' => 'Z',
            'ą' => 'a', 'ć' => 'c', 'ę' => 'e', 'ł' => 'l', 'ń' => 'n', 'ó' => 'o', 'ś' => 's', 'ź' => 'z',
            'ż' => 'z',

            // Latvian
            'Ā' => 'A', 'Č' => 'C', 'Ē' => 'E', 'Ģ' => 'G', 'Ī' => 'i', 'Ķ' => 'k', 'Ļ' => 'L', 'Ņ' => 'N',
            'Š' => 'S', 'Ū' => 'u', 'Ž' => 'Z',
            'ā' => 'a', 'č' => 'c', 'ē' => 'e', 'ģ' => 'g', 'ī' => 'i', 'ķ' => 'k', 'ļ' => 'l', 'ņ' => 'n',
            'š' => 's', 'ū' => 'u', 'ž' => 'z'
        );

        // Make custom replacements
        $str = preg_replace(array_keys($options['replacements']), $options['replacements'], $str);

        $str = str_replace(array_keys($char_map), $char_map, $str);
        // Replace non-alphanumeric characters with our delimiter
        $str = preg_replace('/[^.\p{L}\p{Nd}]+/u', $options['delimiter'], $str);

        // Remove duplicate delimiters
        $str = preg_replace('/(' . preg_quote($options['delimiter'], '/') . '){2,}/', '$1', $str);

        // Truncate slug to max. characters
        $str = mb_substr($str, 0, ($options['limit'] ? $options['limit'] : mb_strlen($str, 'UTF-8')), 'UTF-8');

        // Remove delimiter from ends
        $str = trim($str, $options['delimiter']);

        $return_str = $options['lowercase'] ? mb_strtolower($str, 'UTF-8') : $str;
        return $return_str;
    }
}