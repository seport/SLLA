<?php 
	include('../../dbconfig.php');
	session_start();

   #aes-256-gcm
   $encrypt_method = "AES-256-CBC";
   #$iv = "b3ce09e319019de1";

   #$outputenc = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
   #$outputenc = base64_encode($outputenc);
   #echo "output: ".$outputenc."<br/>";
   ###
   #$outputdec = openssl_decrypt(base64_decode("ZmY1WUxuQldHME14QWF0bjNRVlErQT09"), $encrypt_method, $key, 0, $iv);
   #echo $outputdec;

   if(isset($_POST['user']) && isset($_POST['pass'])){
      $user = $_POST['user'];
      $ivsql = "SELECT iv FROM users WHERE user = '$user'";
      $ivresults = mysql_query($ivsql);
      $ivrow = mysql_fetch_row($ivresults);
      $iv = $ivrow[0];
      $pass = $_POST['pass'];
      #echo $iv;
      $passenc = openssl_encrypt($pass, $encrypt_method, $key, 0, $iv);
      $passenc = base64_encode($passenc);
      #echo $passenc;
      $sql = "SELECT * FROM users WHERE user = '$user' AND pass = '$passenc'";
      $result = mysql_query($sql);
      if(mysql_fetch_row($result) == 0){
         $error = "no such user found";
         $response = json_encode(array("success"=>0,"message"=>$error));
         echo $response;
      }
      else{
         #session_register("user");
         $_SESSION['user'] = $user;

         $response = json_encode(array("success"=>1,"message"=>"Success!"));
         echo $response;
         #header("Location: /admin/");
         exit();
      }
   }
?>