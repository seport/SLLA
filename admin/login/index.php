<?php include "../../head.php"; ?>

<style>
label{
   width:100px;
   display: inline-block;
   text-align: right;
}
</style>

<?php include "../../header.php"; ?>

<div style="width:1000px;margin:auto;">
<h1>Log In</h1>
<div class="alert failure pre" style="display:none;">
   <p><span class="closealert">X</span><span class="message">No such user found.</span></p>
</div>
<form style="margin:auto;width:300px;">
   <p>
      <label>User:</label>
      <input name="user" id="user">
   </p>
   <p>
      <label>Password:</label>
      <input name="pass" id="pass" type="password">
   </p>
   <p>
      <center><button>Login</button></center>
   </p>
</form>
</div>

<?php include "../../scripts.php"; ?>

<script src="../../resources/scripts/admin/login.js"></script>

<?php include "../../footer.php"; ?>