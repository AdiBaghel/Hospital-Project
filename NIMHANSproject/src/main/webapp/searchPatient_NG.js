var app = angular.module("searchPatient", ['GlobalURL']);
app.controller("SearchCtrl", SearchCtrlFun);

function SearchCtrlFun($scope,$http, serverURL) {
	var self = this;
	this.searchP = function(pid) {
		console.log('yyy'+pid);
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/patientAction/searchPatient/' + pid)
		.then(function(response) {
			$scope.names = response.data;
		});
		
	} 
	
	$scope.invokeFun = function(pid) {
		console.log('xxx'+pid);
		window.location.href = "encounterList.jsp?pid="+pid;
	} 
	
}

