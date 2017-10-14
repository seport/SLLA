<?php 
   include '../../session.php';
   include "../../head.php";
?>

<?php include "../../header.php"; ?>

<div style="width:1000px;margin:auto;">
<div class="alerts">
</div>
<p><a href="<? echo $site_path_var ?>admin">Back to moderation queue</a></p>
<h1>Trash</h1>
<div class="events">
   <p class="empty">Loading...</p>
</div>
</div>

<?php include "../../scripts.php"; ?>

<script src="../../resources/scripts/admin/deletedevents.js"></script>

<?php include "../../footer.php"; ?>