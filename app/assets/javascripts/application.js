// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// Autocomplete the input
var autocomplete;
var i;
var j=0;
var word;
var words=[
	"Los Angeles",
	"Westwood",
	"Downtown LA",
	"LAX",
	"Venice"
]
$(document).ready(function(){
	word = "Los Angeles"
	i = 0;
	updatePlaceHolder(word.substring(0,i))
})

function updatePlaceHolder(p){
	$("#autocomplete").attr("placeholder",p + "_")
	i++;
	if(i <= word.length){
		loop = setTimeout(function(){updatePlaceHolder(word.substring(0,i))},250)
	}
	else{
		i=0;
		loop = setTimeout(function(){blinkCursor(word)},500)
	}
}
function blinkCursor(p){
	if(i%2==0){
		$("#autocomplete").attr("placeholder",p)
	}
	if(i%2==1){
		$("#autocomplete").attr("placeholder",p + "_")
	}
	i++
	if(i<6){
		loop = setTimeout(function(){blinkCursor(word)},500)
	}
	else{
		i=0;
		j++;
		j=j%words.length;
		word = words[j];
		updatePlaceHolder(word.substring(0,i))
	}
}
$(document).on('focus',"#autocomplete",function(){
	clearTimeout(loop)
	$("#autocomplete").attr("placeholder","")
})
$(document).on('blur',"#autocomplete",function(){
	i=0;
	j=0;
	word=words[0];
	updatePlaceHolder(word.substring(0,i))
})


//Disable the button
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
