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