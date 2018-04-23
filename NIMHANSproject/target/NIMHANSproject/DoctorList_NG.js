var app = angular.module("AllDoctorList", ['GlobalURL']);
app.controller("AllDoctorListCtrl", AllDoctorListCtrlFun);

function AllDoctorListCtrlFun($scope,$http, serverURL) {
	var self = this;
	this.getDoctorList = function() {
		console.log('yyy');
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/docAction/getAllDoctors')
		.then(function(response) {
			$scope.names = response.data;
		});
		
	} 
	
	this.getDoctorList();
	
	$scope.invokeFun = function(did) {
		console.log('xxx'+did);
		window.location.href = "ViewDoctor.jsp?did="+did;
	} 
	
}

