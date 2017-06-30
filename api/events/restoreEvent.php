<?php 
	include('../../dbconfig.php');
   include '../../session.php';
   
   if(isset($_POST['unpublished_id']) && isset($_SESSION['user'])){
      $fb_id = $_POST['unpublished_id'];
      $sql = "UPDATE calendar SET published = 0 WHERE fb_id = '$fb_id'";
      mysql_query($sql);
   }
?>