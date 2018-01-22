<?php
/**
 * Created by PhpStorm.
 * User: David Tacer
 * Date: 03.01.2016
 * Time: 14:56
 */
function setLanguage() {
    $ci =& get_instance();
    global $IN;

    if(!($ci->uri->segment(0))){

        if($IN->cookie("set_lang1")){
            if (!defined('LANGUAGE'))
                define('LANGUAGE',$IN->cookie("set_lang1"));
        }
        else{
            if (!defined('LANGUAGE'))
                define('LANGUAGE', $ci->config->item('language'));
        }
    }
    if($IN->cookie("set_lang1")){
        if (!defined('LANGUAGE')){
            define('LANGUAGE',$IN->cookie("set_lang1"));
        }

    }
    if (!defined('LANGUAGE'))
        define('LANGUAGE', $ci->config->item('language'));
    $ci->config->set_item('language', LANGUAGE);

}
