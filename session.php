<?php
include('env.php');
include('dbconfig.php');
session_start();

if(!isset($_SESSION['user'])){
	$site_path_var = $_ENV["ROOT_FOLDER"];
	header("Location: " . $site_path_var ."admin/login");
}
?>