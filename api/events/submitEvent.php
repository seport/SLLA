<?php
include_once '../../dbconfig.php';

if(isset($_POST['startTime'])){
	$link = $_POST['fbLink'];
	$regex = '/facebook.com\/events\/[1234567890]+/';
	preg_match($regex, $link, $matches, PREG_OFFSET_CAPTURE);
	if(isset($matches[0])){
		$pre = substr($link,0,$matches[0][1]);
		if($pre == "https://www." || $pre == "http://www." || $pre == "www." || $pre == ""){
			$uselink = substr($link,$matches[0][1],strlen($matches[0][0]));
			preg_match('/[0123456789]+/',$uselink,$fb_id_arr,PREG_OFFSET_CAPTURE);
			$fb_id = $fb_id_arr[0][0];
			$published = 0;
			$startTime = $_POST['startTime'];
			$lat = $_POST['lat'];
			$lng = $_POST['lng'];
			$sql_query = "INSERT INTO calendar(fb_id,published,startTime,lat,lng) VALUES('$fb_id','$published','$startTime','$lat','$lng')";
			$result = mysql_query($sql_query);
			if($result == false){
				$error_query = "SELECT * FROM calendar WHERE fb_id = '$fb_id'";
				$isexists = mysql_query($error_query);
				if($isexists != false){
					$response = json_encode(array("success"=>0,"message"=>"It looks like that event is already in our database! It should appear on our site soon."));
				}
				else{
					$response = json_encode(array("success"=>0,"message"=>"Oops! It looks like there was an error. Try again later?"));
				}
			}
			else{
				$response = json_encode(array("success"=>1,"message"=>"Success! Your protest has been submitted for review."));
			}
		}
		else{
			$response = json_encode(array("success"=>0,"message"=>"Oops! It looks like your link isn't formatted correctly. Make sure it's a valid link to a facebook event."));
		}
	}
	else{
		$response = json_encode(array("success"=>0,"message"=>"Oops! It looks like your link isn't formatted correctly. Make sure it's a valid link to a facebook event."));
	}
	echo $response;
}

?>