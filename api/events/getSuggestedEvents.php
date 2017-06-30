<?php
	include('../../dbconfig.php');

	$events = array();
	$sql = "SELECT fb_id FROM calendar WHERE published = 0";
	$result = mysql_query($sql);
	while($row = mysql_fetch_row($result)){
		array_push($events,$row[0]);
	}
	echo json_encode($events);
?>