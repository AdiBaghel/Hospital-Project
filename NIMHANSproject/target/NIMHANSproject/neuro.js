function toggle(chkbox, group) { 
    var visSetting = (chkbox.checked) ? "visible" : "hidden"; 
    document.getElementById(group).style.visibility = visSetting; 
} 
function swap(radBtn, group) { 
    var modemsVisSetting = (group == "modems") ? ((radBtn.checked) ? "" : "none") : "none"; 
    document.getElementById("modems").style.display = modemsVisSetting; 
}
