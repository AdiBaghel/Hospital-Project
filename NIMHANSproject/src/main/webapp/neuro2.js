function ToneUpperInitial(touppIn){
	document.getElementById("id1").value = touppIn;
}
function ToneLowerInitial(tolowIn){
	document.getElementById("id2").value = tolowIn;
}
function ToneUpperFinal(touppFi){
	document.getElementById("id5").value = touppFi;
}
function ToneLowerFinal(tolowFi){
	document.getElementById("id6").value = tolowFi;
}
function PowerUpperInitial(pouppIn){
	document.getElementById("id3").value = pouppIn;
}
function PowerLowerInitial(polowIn){
	document.getElementById("id4").value = polowIn;
}
function PowerUpperFinal(pouppFi){
	document.getElementById("id7").value = pouppFi;
	console.log(pouppFi);
}
function PowerLowerFinal(polowFi){
	document.getElementById("id8").value = polowFi;
}
function loadLRInitialValue(){
	if(document.getElementById("id1").value!=null)document.getElementById("tluval").value = document.getElementById("id1").value;
	if(document.getElementById("id2").value!=null)document.getElementById("tllval").value = document.getElementById("id2").value;
	if(document.getElementById("id3").value!=null)document.getElementById("pluval").value = document.getElementById("id3").value;
	if(document.getElementById("id4").value!=null)document.getElementById("pllval").value = document.getElementById("id4").value;
}
function loadLRFinalValue(){
	if(document.getElementById("id5").value!=null)document.getElementById("truval").value = document.getElementById("id5").value;
	if(document.getElementById("id6").value!=null)document.getElementById("trlval").value = document.getElementById("id6").value;
	if(document.getElementById("id7").value!=null)document.getElementById("pruval").value = document.getElementById("id7").value;
	if(document.getElementById("id8").value!=null)document.getElementById("prlval").value = document.getElementById("id8").value;
}
