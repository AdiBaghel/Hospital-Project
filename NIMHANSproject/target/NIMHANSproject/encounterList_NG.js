var app = angular.module("EncounterList",['GlobalURL']);
app.controller("EncounterListCtrl",EncounterListFun);


function processForm()  {
    var parameters = location.search.substring(1).split("&");
    var temp = parameters[0].split("=");
    l = unescape(temp[1]);
	  //console.log(l);
  }
  
processForm();


function EncounterListFun($scope, $http, serverURL) {
	$scope.x=l;	
	this.getPatientDetails = function(pid) {
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/patientAction/getPatientbyId/' + pid)//change this
		.then(function(response) {
			$scope.patientInfo = response.data;
		});

	}
	this.getEncounter = function(pid) {
		//console.log('zzz'+pid);
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/encounterAction/getEncounterByPatientId/' + pid)
		.then(function(response) {
			$scope.encounters = response.data;
		});

	}
		  this.getEncounter($scope.x);
		  //console.log('val of x'+$scope.x);
		  this.getPatientDetails($scope.x);

	$scope.invokeTrauma = function(eid) {
		window.location.href = "ViewTrauma.jsp?eid="+eid;
	}
		  
}

