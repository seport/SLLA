<?php
	include('../../dbconfig.php');
	include '../../session.php';

	if(isset($_GET['accept_id']) && isset($_SESSION['user'])) {
	 $sql_query="UPDATE calendar SET published=1 WHERE fb_id=".$_GET['accept_id'];
	 mysql_query($sql_query);
	}
?>