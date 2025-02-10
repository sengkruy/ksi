<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// application/helpers/Telegram_helper.php
//TOKEN="5993052075:AAFh1XQ1JsuWHyDF6xhzMxhrHzavg0m4Vfc"
//    CHAT_ID="-954705358"

function send_to_telegram_group($message,$chat_id = '-954705358') {
    // Include any necessary libraries or configurations for interacting with the Telegram API

    // Define your Telegram API endpoint, bot token, and group chat ID
    
    $bot_token = '5993052075:AAFh1XQ1JsuWHyDF6xhzMxhrHzavg0m4Vfc';
    $telegram_api_endpoint = 'https://api.telegram.org/bot'.$bot_token.'/sendMessage';


    // Prepare the message data
    $data = array(
        'chat_id' => $chat_id,
        'text' => $message
    );

    // Send the message using cURL
    $ch = curl_init($telegram_api_endpoint);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);

    // You can handle the result here if needed
    // For example, you might log any errors or responses from the Telegram API
}
function sendTelegramDocument( $file_path,$chat_id = '-954705358',$caption = '') {
   
    if (!file_exists($file_path)) {
        log_message('error', 'File does not exist: ' . $file_path);
        send_to_telegram_group("File does not exist");
        return; // Exit the function if file does not exist
    }
    log_message('error', 'hello');
     // Telegram Bot API endpoint
     $bot_token = '5993052075:AAFh1XQ1JsuWHyDF6xhzMxhrHzavg0m4Vfc';
     $telegram_api_endpoint = 'https://api.telegram.org/bot' . $bot_token. '/sendDocument';
    // $telegram_api_endpoint = 'https://api.telegram.org/bot'.$bot_token.'/sendMessage';
     $chat_id = "-954705358";
     $ch = curl_init();
     curl_setopt($ch, CURLOPT_URL, "https://api.telegram.org/bot" . $bot_token . "/sendDocument");
     curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
     curl_setopt($ch, CURLOPT_POST, 1);
    
     curl_setopt($ch, CURLOPT_POSTFIELDS, array(
         'chat_id' => $chat_id,
         'document' => new CURLFile($file_path),
         
         'caption' => $caption,
         'disable_notification' => false,
         'reply_to_message_id' => null
     ));
 
     $headers = array(
         'Accept: application/json',
         'Content-Type: application/json'
     );
  //   curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
 
     var_dump($ch);
     $result = curl_exec($ch);
     var_dump($result);
     
     if (curl_errno($ch)) {
         echo 'Error:' . curl_error($ch);
     }
     curl_close($ch);
}
