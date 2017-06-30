$(document).ready(function(){
   var deletedevents = [];
   $.get('/api/events/getDeletedEvents.php',function(result){
      deletedevents = JSON.parse(result);
      if(deletedevents.length <= 0){
         $('.empty').text('The trash is empty.');
      }
      $.each(deletedevents,function(i,event){
         $('.empty').hide();
         var event = "<p class='" + event + "'><a href='https://www.facebook.com/events/" + event + "' target='_blank'>" + event + "</a> <button onClick='restore(" + event + ")'>Restore</button><button onClick='del(" + event + ")'>Delete Forever</button></p>"
         $('.events').append(event);
      })
   })
})
$(document).on('click','.closealert',function(){
   $(this).parent().slideUp();
})
function del(id){
   $.post('/api/events/permadeleteEvent.php',{delete_id:id})
   $('.' + id).hide();
   addAlert("Event successfully deleted.");
}
function restore(id){
   $.post('/api/events/restoreEvent.php',{unpublished_id:id})
   $('.' + id).hide();
   addAlert("Event added to moderation queue.");
}
function addAlert(p){
   var closealert = "<span class='closealert'>X</span>"
   var alert = $("<div></div>").addClass('alert').addClass('success').text(p)
   alert.prepend(closealert)
   alert.hide();
   $('.alerts').append(alert);
   alert.slideDown();
   setTimeout(function(){closeAlert(alert)},5000)
}
function closeAlert(node){
   node.slideUp();
}