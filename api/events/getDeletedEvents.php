<?php
	include('../../dbconfig.php');
	include '../../session.php';

	if(isset($_SESSION['user'])){
		$events = array();
		$sql = "SELECT fb_id FROM calendar WHERE published = 2";
		$result = mysql_query($sql);
		while($row = mysql_fetch_row($result)){
			array_push($events,$row[0]);
		}
		echo json_encode($events);
	}
	else{
		echo "must be logged in as administrator";
	}
?>