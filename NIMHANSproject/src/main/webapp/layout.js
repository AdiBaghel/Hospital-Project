window.onscroll = function() {
	myFunction()
};


var navbar = document.getElementById("navbar");

/*var navbar1 = document.getElementById("navbar1");*/
var sticky = navbar.offsetTop;
/*var sticky1 = navbar1.offsetTop;*/
console.log(sticky);

function myFunction() {
	if (window.pageYOffset >= sticky) {
		navbar.classList.add("sticky");
		/*navbar1.classList.add("sticky1");*/
		
	} else {
		navbar.classList.remove("sticky");
		/*navbar1.classList.remove("sticky1");*/
	}
}
