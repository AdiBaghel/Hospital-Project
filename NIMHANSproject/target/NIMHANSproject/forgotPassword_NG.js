var app = angular.module("Forgot", ['GlobalURL']);
app.controller("ForgotCtrl", ForgotCtrlFun);

function ForgotCtrlFun($scope,$http, serverURL) {
	
	var self=this;
	
	startUpFuctions();
	
	function startUpFuctions(){
	
		processParam();
					
		getUserbyUname(l).then(function(data) {
			self.uData=data;
			console.log(self.uData);
	});

	}
	
	function processParam()  {
		var parameters = location.search.substring(1).split("&");
		var temp = parameters[0].split("=");
		l = unescape(temp[1]);
		console.log("val of l = "+l);

	}
	
	
	function getUserbyUname(uname) {
		var u1 = uname;
		console.log(u1);
		var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/userAction/getUserbyUname/"+u1);
		var promise2 = promise1.then(function(response) {
		console.log(response.data);
		return response.data;
		});
		return promise2;
	}

	self.updateUser=function(userData){
		var uData =userData;
      	return $http.put("http://"+serverURL+"/NIMHANSproject/Services/userAction/updatePassword",uData)
      	.then(function(response){
      		console.log(uData);
          });
       }
	
	self.validateAns=function(){
		
		console.log(self.ques);
		console.log(self.answ);
		console.log(self.pwd);
		if(self.ques==self.uData.secQues){
			if(self.answ==self.uData.secAns){
				 
				 self.uData.password=self.pwd;
				 var userData = angular.toJson(self.uData);
				 
				 self.updateUser(userData).then(function(){
			      		self.successMessage="Data successfully added";
			      		  console.log(self.successMessage);
							 alert('Password Successfully Updated');
							
							 window.location.href = "index.html";

							 
			      	}, function(){
			      		self.errorMessage="There was an error.Please try again";
			              console.log(self.errorMessage);
			              alert('There was an error. Please try again');
			      	});  
				 
				 
			   	}
		
			else{
				alert('Wrong Answer!!');
			}
		}
		else{
			alert('Wrong Security Question!!');
		}
		
	}
		
	
}
