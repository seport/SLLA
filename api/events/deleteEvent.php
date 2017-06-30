<?php
	include('../../dbconfig.php');
	include '../../session.php';

	if(isset($_GET['delete_id']) && isset($_SESSION['user'])) {
	 $sql_query="UPDATE calendar SET published=2 WHERE fb_id=".$_GET['delete_id']." AND published=0";
	 mysql_query($sql_query);
	}
?>