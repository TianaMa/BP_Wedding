var currslid = 0;
var slidint;
function setfoc(id){
	document.getElementById("focpic1").src = picarry[id];
	currslid = id;
	focpic1.style.visibility = "hidden";
	focpic1.filters[0].Apply();
	if (focpic1.style.visibility == "visible") {
		focpic1.style.visibility = "hidden";
		focpic1.filters.revealTrans.transition=23;
	}
	else {
		focpic1.style.visibility = "visible";
		focpic1.filters[0].transition=23;
	}
	focpic1.filters[0].Play();
}

function playnext(){
	if(currslid==2){
		currslid = 0;
	}
	else{
		currslid++;
	};
	setfoc(currslid);
	playit();
}
function playit(){
	slidint = setTimeout(playnext,3000);
}

var picarry = {};
picarry[0] = "images/gg1.jpg";
picarry[1] = "images/gg2.jpg";
picarry[2] = "images/gg3.jpg";