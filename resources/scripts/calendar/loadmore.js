var neweventslist = [];
var page = 1;

function filterLocation(geocode,location){
	window.location.href = "/calendar/?l=" + location + "&lat=" + geocode.lat + "&lng=" + geocode.lng;
}

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

function loadMore(){
	console.log('loadMore()');
	$('.loading').show();
	$(".showmore").hide();
	//set current date
	var today = new Date()
	today.setHours(0);
	today.setMinutes(0);
	today.setSeconds(0);
	today = today.toISOString()
	today = today.split('T');
	today = today[0] + " 00:00:00";

	$.get('../../../api/events/getEvents.php?page=' + page,function(res){
		console.log('GET getEvents');
		neweventslist = res.neweventslist;
		console.log(neweventslist);
		$.get("/api/events/getFbEvent.php",{fb_ids:neweventslist},function(data){
					neweventslist = data;
					console.log(neweventslist);
					neweventslist = _.sortBy(neweventslist,"start_time")
					var ctr = 0;
					neweventslist.forEach(function(event,i){
						console.log('event!');
						event = JSON.parse(event);
						console.log(event);
						if(event.error){

						}
						else{
							var url = "href='https://www.facebook.com/events/" + event.id + "'";
							calendarentryclass = "";
							var geocode = {lat:"",lng:""};
							if(event.place){
								if(event.place.location){
									var geocode = {lat:event.place.location.latitude,lng:event.place.location.longitude};
									if(lng && lat){
										if(geocode.lat > (lat - 0.002) && geocode.lat < (lat + 0.002) && geocode.lng > (lng - 0.002) && geocode.lng < (lng + 0.002)){
											calendarentryclass = "highlighted";
										}
									}
								}
								else{

								}
								var location = event.place.name;
							}
							else{
								var geocode = {lat:"",lng:""}
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

							if(geocode.lat != "" && geocode.lng != ""){
								var marker = new google.maps.Marker({
									position: geocode,
									map: map
								});
								marker.addListener('click', function() {
									filterLocation(geocode,location)
								});
							}
							var calendarentry = '<a ' + url + ' class="' + calendarentryclass + '" target="_blank"><span class="geocode" style="display: none">{"lat":"' + geocode.lat + '","lng":"' + geocode.lng + '"}</span><div style="height: 50px;width:500px;border:1px solid rgba(0, 0, 0, 0.0980392);padding:15px;margin-bottom: 5px;"><span style="width: 50px; float: left"><span style="font-size:12px; color: #fa3e3e;">' + month + '</span><br/><span style="font-size:24px">' + date + '</span></span><span style="float: left;"><span style="font-weight: bold;font-size:14px;width:360px;overflow:hidden;display:block;text-overflow:ellipsis;white-space:nowrap;">' + event.name + '</span><span style="font-size:12px">' + day + " " + time + '</span><br/><span style="font-size:12px; color: #90949c;display:block;white-space:nowrap;width:360px;">' + location + '</span></span><span style="float: right;"><button style="background-color:#f6f7f9;border:1px solid rgb(206, 208, 212);border-radius:2px;color:#4b4f56;font-weight:bold;font-size:12px;">View Event</button></span></div></a>'
							$(".calendar").append(calendarentry);
						}
						ctr++;
						if(ctr == neweventslist.length){
							console.log('done!');
							$('.loading').hide();
							console.log(res);
							if(res.showmore == false){
								$(".showmore").hide();
							}
							else{
								$(".showmore").show();
							}
						}
					})//forEach
				}).fail(function(response){
					console.log(response)
				})

		/*var promises = [];
		neweventslist.forEach(function(event,i){
			console.log('event');
			promises.push(
				$.get("/api/events/getFbEvent.php",{fb_id:event},function(data){
					console.log(data);
					if(IsJsonString(data)){
						neweventslist[i] = JSON.parse(data);
					}
				}).fail(function(response){
					console.log('error! ' + eventslist[i])
				})
			)
		})

		Promise.all(promises).then(function(){
			console.log('promise done');
			neweventslist = _.sortBy(neweventslist,"start_time")
			neweventslist.forEach(function(event,i){
				var url = "href='https://www.facebook.com/events/" + event.id + "'";
				calendarentryclass = "";
				var geocode = {lat:"",lng:""};
				if(event.place){
					if(event.place.location){
						var geocode = {lat:event.place.location.latitude,lng:event.place.location.longitude};
						if(lng && lat){
							if(geocode.lat > (lat - 0.002) && geocode.lat < (lat + 0.002) && geocode.lng > (lng - 0.002) && geocode.lng < (lng + 0.002)){
								calendarentryclass = "highlighted";
							}
						}
					}
					else{

					}
					var location = event.place.name;
				}
				else{
					var geocode = {lat:"",lng:""}
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

				if(geocode.lat != "" && geocode.lng != ""){
					var marker = new google.maps.Marker({
						position: geocode,
						map: map
					});
					marker.addListener('click', function() {
						filterLocation(geocode,location)
					});
				}
				var calendarentry = '<a ' + url + ' class="' + calendarentryclass + '" target="_blank"><span class="geocode" style="display: none">{"lat":"' + geocode.lat + '","lng":"' + geocode.lng + '"}</span><div style="height: 50px;width:500px;border:1px solid rgba(0, 0, 0, 0.0980392);padding:15px;margin-bottom: 5px;"><span style="width: 50px; float: left"><span style="font-size:12px; color: #fa3e3e;">' + month + '</span><br/><span style="font-size:24px">' + date + '</span></span><span style="float: left;"><span style="font-weight: bold;font-size:14px;width:360px;overflow:hidden;display:block;text-overflow:ellipsis;white-space:nowrap;">' + event.name + '</span><span style="font-size:12px">' + day + " " + time + '</span><br/><span style="font-size:12px; color: #90949c;display:block;white-space:nowrap;width:360px;">' + location + '</span></span><span style="float: right;"><button style="background-color:#f6f7f9;border:1px solid rgb(206, 208, 212);border-radius:2px;color:#4b4f56;font-weight:bold;font-size:12px;">View Event</button></span></div></a>'
				$(".calendar").append(calendarentry)
			})//foreach
		}).then(function(){
			console.log('done!');
			$('.loading').hide();
			if(res.showmore == false){
				$(".showmore").hide();
			}
			else{
				$(".showmore").show();
			}
		})*/
	});
	page++;
}