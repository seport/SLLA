//0. define variables
var eventslist = [];
var autocomplete;
var la = {lat: 34.052234, lng: -118.243685};
var calendarentryclass;

function initMap(){
	console.log('initMap()');

//initiate autocomplete
autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'))
autocomplete.addListener('place_changed', function(){
	var place = autocomplete.getPlace()
	var geo = {lat:place.geometry.location.lat(),lng:place.geometry.location.lng()}
	filterLocation(geo,place.name)
});

//initiate the map
if(lat && lng){
	var searchgeocode = {lat:lat,lng:lng}
	map = new google.maps.Map(document.getElementById('map'), {
		zoom: 13,
		center: searchgeocode
	});
	if(l){
		$(".searchlocation").text(decodeURIComponent(l))
		$(".searchinfo").show();
	}
}
else{
	map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 11,
	  center: la
	});
}

//load entries
console.log('calling loadMore()...');
loadMore();
}