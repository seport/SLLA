<?php
include_once '../dbconfig.php';
$GLOBAL['page'] = 0;
$limit = 10;
?>

<?php include '../head.php'; ?>

<?php include '../header.php'; ?>


<div id="map"></div>
<div class="content">
<h1 style="margin-bottom:0px;">Calendar</h1>
<input id="autocomplete">
<p class="searchinfo" style="display:none; font-size:12px; color: grey;">Displaying all Events within 10 miles of <span class="searchlocation"></span>
<br/><br/>
<button class="clearsearch" style="cursor:pointer">Clear Search Results</button></p>
<div class="calendar">
</div>
<div class="loading">
Loading...
</div>
<div class="showmore" style="display: none;">
	<a href='javascript:loadMore()'><button>Show More!</button></a>
</div>
</div>






<?php include "../scripts.php"; ?>

<script src="../resources/scripts/calendar.js"></script>

<script>
<?php
if(isset($_GET['lat'])){
	?>
	var lat = <?php echo $_GET['lat']; ?>;
	<?php
}
else{
	?>
	var lat = "";
	<?php
}

if(isset($_GET['lng'])){
	?>
	var lng = <?php echo $_GET['lng']; ?>;
	<?php
}
else{
	?>
	var lng = "";
	<?php
}

if(isset($_GET['l'])){
	?>
	var l = "<?php echo $_GET['l']; ?>";
	<?php
}
else{
	?>
	var l = "";
	<?php
}
?>
</script>

<script src="../resources/scripts/calendar/initmap.js"></script>

<script src="../resources/scripts/calendar/loadmore.js"></script>

<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQu5em7L8CGjTmAHxQCOP8S7N-KHGpKNM&libraries=places&callback=initMap">
</script>


<?php include "../footer.php"; ?>