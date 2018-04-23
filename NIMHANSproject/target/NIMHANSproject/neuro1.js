function check1(escore) {

		var e1= escore;
		var e2 = "E";
		var e = e2+e1;
		document.getElementById("erbi").value = e;
	}
	function check2(mscore) {
		var m1= mscore;
		var m2 = "M";
		var m = m2+m1;
		document.getElementById("mrbi").value = m;
	}
	function check3(vscore) {
		var v1= vscore;
		var v2 = "V";
		var v = v2+v1;
		document.getElementById("vrbi").value = v;
	}
	function check4(efscore) {
		var e1= efscore;
		var e2 = "E";
		var e = e2+e1;
		document.getElementById("eraf").value = e;
	}
	function check5(mfscore) {
		var m1= mfscore;
		var m2 = "M";
		var m = m2+m1;
		document.getElementById("mraf").value = m;
	}
	function check6(vfscore) {
		var v1= vfscore;
		var v2 = "V";
		var v = v2+v1;
		document.getElementById("vraf").value = v;
	}
	function loadIntitialValue(){

		var e1 = document.getElementById("erbi").value;
		var v1 = document.getElementById("vrbi").value;
		var m1 = document.getElementById("mrbi").value;
		document.getElementById("erai").value = e1;
		document.getElementById("mrai").value = m1;
		document.getElementById("vrai").value = v1;
		}
	function loadFinalValue(){

		var e1 = document.getElementById("eraf").value;
		var v1 = document.getElementById("vraf").value;
		var m1 = document.getElementById("mraf").value;
		if(e1!=null) document.getElementById("erbf").value = e1;
		if(m1!=null) document.getElementById("mrbf").value = m1;
		if(v1!=null) document.getElementById("vrbf").value = v1;
		}
