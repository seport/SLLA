var eventslist = [];
$(document).ready(function(){
	$.get('/api/events/getSuggestedEvents.php',function(events){
		eventslist = JSON.parse(events);
		console.log(eventslist);
		if(eventslist.length < 1){
			$('.noresults').html("There are currently no events awaiting moderation.");
		}

		$.get("/api/events/getFbEvent.php",{fb_ids:eventslist},function(data){
			console.log(data);
			eventslist = data;
			if(eventslist.length >= 1){
				$('.noresults').remove();
			}
			else{
				$('.noresults').html("There are currently no events awaiting moderation.");
			}
			eventslist.forEach(function(event,i){
				event = JSON.parse(event);
				var url = "href='https://www.facebook.com/events/" + event.id + "'";
				if(event.place){
					if(event.place.location){
						var geocode = {lat:event.place.location.latitude,lng:event.place.location.longitude};
					}
					else{
						var geocode = {lat:"",lng:""};
					}
					var location = event.place.name;
				}
				else{
					var geocode = {lat:"",lng:""};
					var location = "";
				}
				parsedstart = event.start_time.split(/[^0-9]/);
				var start = new Date(parsedstart[0],(parsedstart[1] - 1),parsedstart[2],parsedstart[3],parsedstart[4],parsedstart[5]);
				start = start.toString();
				start = start.split(" ");
				var month = start[1];
				var date = parseInt(start[2]);
				var day = start[0];
				var time = formatTime(start[4]);

				var calendarentry = '<div class="event" style="height: 50px;width:500px;border:1px solid rgba(0, 0, 0, 0.0980392);padding:15px;margin-bottom: 5px;"><span class="geocode" style="display: none">{"lat":"' + geocode.lat + '","lng":"' + geocode.lng + '"}</span><span class="id" style="display:none;">' + event.id + '</span><span style="width: 50px; float: left"><span style="font-size:12px; color: #fa3e3e;">' + month + '</span><br/><span style="font-size:24px">' + date + '</span></span><span style="float: left;"><span style="font-weight: bold;font-size:14px;width:360px;overflow:hidden;display:block;text-overflow:ellipsis;white-space:nowrap;">' + event.name + '</span><span style="font-size:12px">' + day + " " + time + '</span><br/><span style="font-size:12px; color: #90949c;display:block;white-space:nowrap;width:360px;">' + location + '</span></span><span style="float: right;"><a href="javascript:accept_id(' + event.id + ')"><button style="background-color:#f6f7f9;border:1px solid rgb(206, 208, 212);border-radius:2px;color:#4b4f56;font-weight:bold;font-size:12px;">Accept</button></a><br/><a href="javascript:delete_id(' + event.id + ')"><button style="background-color:#f6f7f9;border:1px solid rgb(206, 208, 212);border-radius:2px;color:#4b4f56;font-weight:bold;font-size:12px;">Delete</button></a></span></div>'
				$(".calendar").append(calendarentry)
			})
		})
	});
});

$(document).on('click','.event',function(e){
	var win = window.open('http://facebook.com/events/' + $(this).children().closest(".id").text(), '_blank');
	if (win) {
	    //Browser has allowed it to be opened
	    win.focus();
	} else {
	    //Browser has blocked it
	    alert('Please allow popups for this website');
	}
})

$(document).on('click','.event button',function(e){
	e.stopPropagation()
})

function formatTime(t){
	t = t.split(":")
	ampm = "pm";
	if(parseInt(t[0]) == 0){
		t[0] = "12"
		var ampm = "am";	
	}
	else if(parseInt(t[0]) > 0 && parseInt(t[0]) < 12){
		if(t[0][0] == 0){
			t[0] = t[0].slice(1)
		}
		var ampm = "am";
	}
	else if(parseInt(t[0]) == 12){
		var ampm = "pm";
	}
	else if(parseInt(t[0])>12){
		t[0] = parseInt(t[0])%12;
		var ampm = "pm";
	}
	t = t[0] + ":" + t[1] + "" + ampm
	return t;
}

function delete_id(id)
{
	$.get('/api/events/deleteEvent.php',{delete_id:id});
	$('.event:contains("' + id + '")').remove();
}

function accept_id(id)
{
	$.get('/api/events/acceptEvent.php',{accept_id:id});
	$('.event:contains("' + id + '")').remove();
}