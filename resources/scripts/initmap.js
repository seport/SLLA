function initMap() {
	var query = $(location).attr('href');
	autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'))
	autocomplete.addListener('place_changed', function(){
		var place = autocomplete.getPlace()
		var geo = {lat:place.geometry.location.lat(),lng:place.geometry.location.lng()}
		url="calendar/?l=" + place.name + "&lat=" + geo.lat + "&lng=" + geo.lng
		window.location.href = url;
		//filterLocation(geo,place.name)
	});
}//function