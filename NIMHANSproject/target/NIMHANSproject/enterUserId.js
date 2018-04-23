var app = angular.module("EnterUser", []);
app.controller("EnterUserCtrl", EnterUserCtrlFun);

function EnterUserCtrlFun($scope,$http) {
	
	var self=this;
	
   	
	self.getUsername=function(){
		
		var uname=self.username;
		
		window.location.href = "forgotPassword.html?uname="+uname;
		
	}
	
}
