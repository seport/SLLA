<?php
#error_reporting(E_ALL);
#ini_set("display_errors", "On");
include_once '../dbconfig.php';
include '../session.php';
?>
<?php include '../head.php' ?>

<?php include '../header.php'; ?>

<div class="content">
<p>Logged in as <?php echo $_SESSION['user']; ?>. <a href="<?php echo $site_path_var ?>admin/logout">Log out?</a></p>
<p><a href="<?php echo $site_path_var ?>admin/trash">View Deleted Events</a></p>
<h1>Moderate Suggested Event<span class="hiddenbutton">s</span></h1>
<div class="calendar">
	<p class="noresults">Loading...</p>
</div>

</div>

<?php include '../scripts.php'; ?>

<script src="../resources/scripts/admin/pendingevents.js"></script>

<?php include '../footer.php'; ?>