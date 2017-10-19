<?php 
 	include('../../dbconfig.php');
 	session_start();

    $encrypt_method = "AES-256-CBC";
    $encrypt_key = "my super secret key";

    if(isset($_POST['user']) && isset($_POST['pass'])){
       $user = $_POST['user'];
       $ivsql = "SELECT iv FROM users WHERE user = '$user'";
       $ivresults = mysql_query($ivsql);
       $ivrow = mysql_fetch_row($ivresults);
       $iv = $ivrow[0];
       $pass = $_POST['pass'];

       $passenc = openssl_encrypt($pass, $encrypt_method, $encrypt_key, 0, $iv);
       $passenc = base64_encode($passenc);
       $sql = "SELECT * FROM users WHERE user = '$user' AND pass = '$passenc'";
       $result = mysql_query($sql);
      if(mysql_fetch_row($result) == 0){
         $error = "no such user found";
         $response = json_encode(array("success"=>0,"message"=>$error));
         echo $response;
      }
      else{
         $_SESSION['user'] = $user;

         $response = json_encode(array("success"=>1,"message"=>"Success!"));
         echo $response;
         exit();
      }
    }
?>