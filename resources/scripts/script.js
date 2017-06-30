$(document).on('click','.closebubble',function(){
	$('.bubble').remove();
})

$(document).on('click','.closealert',function(){
	$('.alert').slideUp("slow");
})

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}