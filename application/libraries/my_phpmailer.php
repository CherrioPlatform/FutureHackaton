<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class My_PHPMailer {
    public function My_PHPMailer() {
        require_once('PHPMailer/class.phpmailer.php');
    }
    public function SendEmail($connect_data, $reciver_email, $email_content, $gmail = false, $find = array(), $replace = array()){

        $to = $reciver_email[0];
        $mail = new PHPMailer();

        //smtp settings
        $mail->IsSMTP(); // enable SMTP
        $mail->SMTPDebug = 0;  // debugging: 1 = errors and messages, 2 = messages only
        $mail->SMTPAuth = true;  // authentication enabled
        if($gmail)
            $mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for Gmail

        $mail->Host = $connect_data['smtp_host'];
        $mail->Port = $connect_data['smtp_port'];
        $mail->Username = $connect_data['smtp_username'];
        $mail->Password = $connect_data['smtp_password'];

        $mail->CharSet = 'UTF-8';
        $mail->From = $connect_data['email_sender'];
        $mail->FromName = $email_content['email_title'];
        $mail->AddAddress($to, "");

        $len = count($reciver_email);
        if($len > 1){
            for($i = 1; $i < $len; $i++){
                $mail->AddBcc($reciver_email[$i], "");
            }
        }
        $mail->WordWrap = 50;

        $mail->IsHTML(true);
        $mail->Subject = str_replace($find, $replace, $email_content['email_subject']);
        $mail->Body = $email_content['email_message'];

        $mail->Send();

        $mail->ClearAddresses();
        $mail->ClearAttachments();

        $mail->SmtpClose();

    }
}