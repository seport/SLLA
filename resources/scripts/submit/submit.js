var fbeventlinkregex = /facebook.com\/events\/[1234567890]+/;
var startTime;
var lat;
var lng;
var fbid;


$(document).on('click','.submitbutton',function(e){
	var link = $(".fbLink").val();
	$('.submitbutton').prop("disabled",true);
	$('.fbLink').prop("disabled",true);

	console.log('submit');

	if(link.match(fbeventlinkregex)){
		var fbLink = link;
		var fbid = fbLink.match(/[1234567890]+/);
		fbids = [];
		fbids.push(fbid[0]);
		$.get("/api/events/getFbEvent.php",{fb_ids:fbids},function(data){
			if(IsJsonString(data)){
				data = JSON.parse(data);
				console.log(data);
				startTime = data.start_time;
				var lat = 0;
				var lng = 0;
				if(data.place){
					if(data.place.location){
						lat = data.place.location.latitude;
						lng = data.place.location.longitude;
					}
				}

				$.post('/api/events/submitEvent.php',{fbLink:fbLink,startTime:startTime,lat:lat,lng:lng},function(data){
					data = JSON.parse(data);
					$(".pre .message").html(data.message);
					if(data.success == 1){
						$(".pre").removeClass("failure");
						$(".pre").addClass("success");
					}
					else{
						$(".pre").removeClass("success");
						$(".pre").addClass("failure");
					}
					$(".pre").slideDown();
					$('.submitbutton').prop("disabled",false);
					$('.fbLink').prop("disabled",false);
					$('.fbLink').val("");
				})
			}
			else{
				$(".pre .message").html("facebook event does not exist");
				$(".pre").removeClass("success");
				$(".pre").addClass("failure");
				$(".pre").slideDown();
				$('.submitbutton').prop("disabled",false);
				$('.fbLink').prop("disabled",false);
				$('.fbLink').val("");
			}
		}).fail(function(){
			$(".pre").removeClass("success");
			$(".pre").addClass("failure");
			$(".pre .message").html("Oops! That's not a valid facebook event!");
			$(".pre").slideDown();
			$('.submitbutton').prop("disabled",false);
			$('.fbLink').prop("disabled",false);
			$('.fbLink').val("");
		})
	}
	else{
		$(".pre").slideDown();
		$('.submitbutton').prop("disabled",false);
		$('.fbLink').prop("disabled",false);
		$('.fbLink').val("");
	}
})