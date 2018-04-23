function toggle(chkbox, group) { 
    var visSetting = (chkbox.checked) ? "visible" : "hidden"; 
    document.getElementById(group).style.visibility = visSetting; 
} 
function swap(radBtn, group) { 
    var modemsVisSetting = (group == "modems") ? ((radBtn.checked) ? "" : "none") : "none"; 
    document.getElementById("modems").style.display = modemsVisSetting; 
} 
function show1(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display = 'block';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='block';
	}
function show2(){
	  document.getElementById('div1').style.display = 'block';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='none';
	}
function show3(){
		  document.getElementById('div2').style.display ='none';
		  document.getElementById('div3').style.display = 'block';
		  document.getElementById('div4').style.display = 'none';
		  document.getElementById('div5').style.display ='none';
		  document.getElementById('div6').style.display ='none';
		  document.getElementById('div7').style.display ='none';
		}
function show4(){
		  document.getElementById('div3').style.display = 'none';
		  document.getElementById('div2').style.display = 'block';
		  document.getElementById('div4').style.display = 'none';
		  document.getElementById('div5').style.display ='none';
		  document.getElementById('div6').style.display ='none';
		  document.getElementById('div7').style.display ='none';
		}
function show5(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display ='none';
	  document.getElementById('div5').style.display ='block';
	  document.getElementById('div6').style.display ='none';
	  document.getElementById('div7').style.display ='none';
}
function show6(){
	  document.getElementById('div1').style.display ='none';
	  document.getElementById('div2').style.display ='none';
	  document.getElementById('div3').style.display ='none';
	  document.getElementById('div4').style.display ='none';
	  document.getElementById('div5').style.display ='none';
	  document.getElementById('div6').style.display ='block';
	  document.getElementById('div7').style.display ='none';
}
