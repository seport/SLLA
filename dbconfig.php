<?php
    $host = "localhost";
    $user = "root";
    $password = "";
    $database = "SLLA";
    $link = mysql_connect($host,$user,$password);
    mysql_select_db($database,$link);    

    $fbt = "GET_A_TOKEN";
    $key = "GET_A_KEY";
?>