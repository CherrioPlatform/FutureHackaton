<?php
/**
 * Created by PhpStorm.
 * User: David Tacer
 * Date: 14.11.2014
 * Time: 14:55
 */
class MY_URI extends CI_URI {

    function uri_string() {
        return str_replace('_', '-', $this->uri_string);
    }

}