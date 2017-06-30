<?php
#error_reporting(E_ALL);
#ini_set("display_errors", "On");
include_once '../dbconfig.php';
?>

<?php include '../head.php' ?>

<link rel="stylesheet" type="text/css" href="../resources/css/submitstyle.css" />

<?php include '../header.php'; ?>

<div class="content" style="width:1000px; margin: auto;">
<div class="alert failure pre" style="display:none;">
	<p><span class="closealert">X</span><span class="message">Oops! It looks like your link isn't formatted correctly. Make sure it's a valid link to a facebook event.</span></p>
</div>
<h1>Submit</h1>
<p>Keeping this list of protests up to date is a community effort. Here's how you can help:</p>
<ol>
	<li>Copy and paste the facebook event link into the form below.</li>
	<li>The event will appear in the list once a moderator has approved it.</li>
</ol>
	<p>
	<input class="fbLink" required /><button class="submitbutton">Submit</button>
	</p>

</div>

<?php include "../scripts.php"; ?>

<script src="../resources/scripts/submit/submit.js"></script>

<?php include '../footer.php' ?>