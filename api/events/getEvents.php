<?php
include_once '../../dbconfig.php';
header('content-type: application/json; charset=utf-8');
header("access-control-allow-origin: http://www.stayloudla.com");
if($_GET['page']){
	$limit = 5;
	$neweventslist = array();
	$page = $_GET['page'] - 1;
	$page_start = $page * $limit;
	$show_more_start = ($page + 1) * $limit;
	date_default_timezone_set('America/Los_Angeles');
	$today = date('Y-m-d 0:0:0');
	#$today = '2017-02-02 12:00:00';
	if(isset($_GET['lat']) && isset($_GET['lng'])){
		$upperlat = $_GET['lat'] + 0.1;
		$lowerlat = $_GET['lat'] - 0.1;
		$upperlng = $_GET['lng'] + 0.1;
		$lowerlng = $_GET['lng'] - 0.1;
		$sql_query = "SELECT * FROM calendar WHERE published = 1 AND startTime > '$today' AND lat < $upperlat AND lat > $lowerlat AND lng < $upperlng AND lng > $lowerlng ORDER BY startTime ASC LIMIT $page_start,$limit";
		$show_more_query = "SELECT * FROM calendar WHERE published = 1 AND startTime > '$today' AND lat < $upperlat AND lat > $lowerlat AND lng < $upperlng AND lng > $lowerlng ORDER BY startTime ASC LIMIT $show_more_start,1";
	}
	else{
		$sql_query = "SELECT * FROM calendar WHERE published = 1 AND startTime > '$today' ORDER BY startTime ASC LIMIT $page_start,$limit";
		$show_more_query = "SELECT * FROM calendar WHERE published = 1 AND startTime > '$today' ORDER BY startTime ASC LIMIT $show_more_start,1";
	}
	$result_set = mysql_query($sql_query);
	$show_more_result = mysql_query($show_more_query);
	if(mysql_fetch_row($show_more_result) == 0){
		$showmore = false;
	}
	else{
		$showmore = true;
	}
	while($row = mysql_fetch_row($result_set)){
		array_push($neweventslist,$row[1]);
	}
	$result = json_encode(array("neweventslist"=>$neweventslist,"showmore"=>$showmore));
	echo $result;
}
else{
	echo "no page specified";
}
?>