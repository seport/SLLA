<?php include "head.php"; ?>

<link rel="stylesheet" type="text/css" href="resources/css/indexstyle.css"/>

<?php include "header.php"; ?>

<div class="content">
	<div class="hero">
		<div class="herotext">
			<h1>Find A Protest Near You</h1>
			<input id="autocomplete">
		</div>
	</div>
	<div class="stats">
		<div>
			<center><i class="fa fa-users" aria-hidden="true"></i></center>
			<p><b>750,000</b> people showed up for the Women's March downtown.</p>
		</div>
		<div>
			<center><i class="fa fa-plane" aria-hidden="true"></i></center>
			<p>An estimated <b>7,000+</b> showed up at LAX the next weekend to speak up against Trump's Muslim Ban.</p>
		</div>
	</div>
	<div style="background:linear-gradient(rgba(127,52,90,0.75),rgba(127,52,90,0.75)),url('resources/images/lamap.png');background-size:cover;background-position:center;">
		<div style="width:1000px; margin: auto; padding-top: calc(40vh - 100px);padding-bottom: calc(40vh - 100px); color:white;font-size:18px;">
			<p>LA's participation in these protests against the Trump administration's unconstitutional policies have <b style="color:#FF69B4;background:white;">proven all of the stereotypes about this city wrong</b>. LA is filled with passionate and engaged activists who have inspired us to keep the momentum going and apply as much pressure as we can on the new administration. This group is here for all of us to share ideas on how to continue to stay active in this fight. Let's stay loud, LA!</p>
		</div>
	</div>
	<div style="background:black; margin:0;padding-top:10%;padding-bottom:10%">
		<div class="stats" style="margin-top:0;margin-bottom:0">
			<a href="/calendar" class="button">Calendar of Protests &rarr;</a>
			<a href="/submit" class="button">Submit a Protest &rarr;</a>
			<a href="https://www.facebook.com/groups/1203067669814957/?ref=br_tf&qsefr=1" target="_blank" class="button">Check out the Facebook Group &rarr;</a>
		</div>
	</div>
</div>
<?php include "scripts.php"; ?>

<script src="resources/scripts/autocomplete.js"></script>
<script src="/resources/scripts/initmap.js"></script>
<script async defer 
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQu5em7L8CGjTmAHxQCOP8S7N-KHGpKNM&libraries=places&callback=initMap"></script>

<?php include "footer.php"; ?>