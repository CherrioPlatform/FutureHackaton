<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('send_email'))
{
    function send_email($email_message = null, $reciver_email = array(), $email_subject = EMAIL_SUBJECT)
    {
        $ci =& get_instance();
        $email_content['email_message'] = $email_message;
        $connect_data['smtp_password'] = SMTP_PASSWORD;
        $connect_data['smtp_username'] = SMTP_USERNAME;
        $connect_data['smtp_host'] = SMTP_HOST;
        $connect_data['smtp_port'] = SMTP_PORT;
        $connect_data['email_sender'] = EMAIL_SENDER;
        $email_content['email_title'] = EMAIL_TITLE;
        $email_content['email_subject'] = $email_subject;

        $ci->load->library('my_phpmailer');
        $ci->my_phpmailer->SendEmail($connect_data, $reciver_email, $email_content, true);
    }
}
if ( ! function_exists('progress_procentage'))
{
    function progress_procentage($goal, $raised) {
        $progress = round((($raised/$goal)*100),2);
        if($progress > 100)
            $progress = 100;
        return $progress;
    }
}

if ( ! function_exists('get_session_data'))
{
    function get_session_data($session_name = 'logged_in_site'){
        $ci =& get_instance();

        if($ci->session->userdata($session_name))
        {
            return $ci->session->userdata($session_name);
        }
        return NULL;
    }
}

if ( ! function_exists('truncate'))
{
    function truncate($str, $len) {
        $tail = max(0, $len-10);
        $trunk = substr($str, 0, $tail);
        $trunk .= strrev(preg_replace('~^..+?[\s,:]\b|^...~', '...', strrev(substr($str, $tail, $len-$tail))));
        return $trunk;
    }
}

if ( ! function_exists('base_urll'))
{
    function base_urll() {
        return base_url().LANGUAGE."/";
    }
}
if ( ! function_exists('wei2eth'))
{
    function wei2eth($wei)
    {
        return bcdiv($wei,'1000000000000000000',18);
    }
}

if ( ! function_exists('get_balance'))
{
    function get_balance($address)
    {

        if(!empty($address))
        {
            if(!ETH_TESTNET)
                $urlBalance = "http://api.etherscan.io/api?module=account&action=balance&tag=latest&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";
            else
                $urlBalance = "http://rinkeby.etherscan.io/api?module=account&action=balance&tag=latest&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";

            $url = $urlBalance.'&address='.$address;

            $data = json_decode(file_get_contents($url));

            return wei2eth($data->result);
        }
        return false;
    }
}

if ( ! function_exists('get_number_of_donators'))
{
    function get_number_of_donators($address)
    {
        if(!empty($address))
        {
            if(!ETH_TESTNET)
                $urlTransactions = "http://api.etherscan.io/api?module=account&action=txlist&startblock=0&endblock=99999999&sort=desc&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";
            else
                $urlTransactions = "http://rinkeby.etherscan.io/api?module=account&action=txlist&startblock=0&endblock=99999999&sort=desc&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";

            $url = $urlTransactions.'&address='.$address;

            $data = json_decode(file_get_contents($url));

            $count = 0;

            foreach ($data->result as $transaction)
            {
                if(strtoupper($transaction->to) == strtoupper($address))
                {
                    $count++;
                }
            }
            return $count;
        }
    }
}

if ( ! function_exists('get_transactions'))
{
    function get_transactions($to, $from = false)
    {
        if(!empty($to))
        {
            if(!ETH_TESTNET)
                $urlTransactions = "http://api.etherscan.io/api?module=account&action=txlist&startblock=0&endblock=99999999&sort=desc&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";
            else
                $urlTransactions = "http://rinkeby.etherscan.io/api?module=account&action=txlist&startblock=0&endblock=99999999&sort=desc&apikey=E311MMGX3D8VJZTNGFK3F5I4NGUDMX2CPX";

            $url = $urlTransactions.'&address='.$to;

            $data = json_decode(file_get_contents($url));

            $transactions = array();

            foreach ($data->result as $transaction)
            {
                $transaction->value = wei2eth($transaction->value);

                if($from)
                {
                    if (strtoupper($transaction->to) == strtoupper($to) && strtoupper($transaction->from) == strtoupper($from)) {
                        $transactions[] = $transaction;
                    }
                }
                else
                {
                    if (strtoupper($transaction->to) == strtoupper($to))
                    {
                        $transactions[] = $transaction;
                    }
                }
            }
            return $transactions;

        }

        return false;
    }
}
if ( ! function_exists('is_address'))
{
    function is_address($address) {
        if (!preg_match('/^(0x)?[0-9a-f]{40}$/i',$address)) {
            // check if it has the basic requirements of an address
            return false;
        } elseif (!preg_match('/^(0x)?[0-9a-f]{40}$/',$address) || preg_match('/^(0x)?[0-9A-F]{40}$/',$address)) {
            // If it's all small caps or all all caps, return true
            return true;
        } else {
            // Otherwise check each case
            return is_checksumAddress($address);
        }
    }
}
if ( ! function_exists('is_checksumAddress'))
{
    function is_checksumAddress($address) {
        // Check each case
        $address = str_replace('0x','',$address);
        $addressHash = hash('sha3',strtolower($address));
        $addressArray=str_split($address);
        $addressHashArray=str_split($addressHash);

        for($i = 0; $i < 40; $i++ ) {
            // the nth letter should be uppercase if the nth digit of casemap is 1
            if ((intval($addressHashArray[$i], 16) > 7 && strtoupper($addressArray[$i]) !== $addressArray[$i]) || (intval($addressHashArray[$i], 16) <= 7 && strtolower($addressArray[$i]) !== $addressArray[$i])) {
                return false;
            }
        }
        return true;
    }
}

if ( ! function_exists('days_till'))
{
    function days_till($date, $finishedDate = true)
    {
        $seconds = strtotime($date) - time();

        if($finishedDate)
        {
            $seconds = time() - strtotime($date);
        }

        $days = floor($seconds / 86400);
        $seconds %= 86400;

        $hours = floor($seconds / 3600);
        $seconds %= 3600;

        $minutes = floor($seconds / 60);

        if($days < 0 && $hours < 0 && $minutes < 0)
            return 0;

        switch($days)
        {
            case 1:
            {
                $return = $days.' day '.$hours.' hrs';
            }
                break;
            case 0:
            {
                if($hours > 0)
                {
                    $return = $hours.' hrs '.$minutes.' min';
                }
                else
                {
                    $return = $minutes.' min';
                }
            }
                break;
            default:
            {
                $return = $days.' days '.$hours.' hrs';
            }
                break;
        }
        return $return;
    }
 
}