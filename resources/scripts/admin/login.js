$('button').on('click',function(e){
   e.preventDefault();
    var user = $('#user').val();
    var pass = $('#pass').val();
    $.post('../../api/authentication/login.php',{user:user,pass:pass},function(res){
       console.log(res)
       if(IsJsonString(res)){
          res = JSON.parse(res);
          if(res.success == 1){
             window.location.replace("../../admin");
          }
         else{
            $('.pre .message').html(res.message);
            $('.pre').slideDown();
         }
       }
      else{
            $('.pre .message').html(res.message);
            $('.pre').slideDown();         
      }
    })
})