var app = angular.module("viewDoctor", ['GlobalURL']);
app.controller("viewDoctorCtrl", viewDoctorFun);

function viewDoctorFun($scope,$http, serverURL) {
	

	function processParam()  {
		var parameters = location.search.substring(1).split("&");
		var temp = parameters[0].split("=");
		l = unescape(temp[1]);
		console.log("val of l = "+l);

	}
	
	processParam();
	
	var self=this;

	self.getDoctorbyId = function(did) {
		var d1 = did;
		var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/docAction/getDoctorbyId/"+d1);
		var promise2 = promise1.then(function(response) {
		console.log(response.data);
		return response.data;
		});
		return promise2;
	}
   	
	self.getDoctorbyId(l).then(function(data) {
		self.dData=data;
		console.log(self.dData);
	});
	
	
	
}

