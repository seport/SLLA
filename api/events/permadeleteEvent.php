<?php 
	include('../../dbconfig.php');
	include '../../session.php';

	if(isset($_POST['delete_id']) && isset($_SESSION['user'])){
	  $fb_id = $_POST['delete_id'];
	  $sql = "DELETE FROM calendar WHERE fb_id = '$fb_id'";
	  mysql_query($sql);
	}
?>