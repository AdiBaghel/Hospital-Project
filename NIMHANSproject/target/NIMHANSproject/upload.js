//inject angular file upload directives and services.
var app = angular.module('fileUpload', ['ngFileUpload','signature']);

app.controller('MyCtrl', ['$scope', 'Upload', '$timeout', function ($scope, Upload, $timeout) {
  	$scope.boundingBox = {
        width: 750,
        height: 400
    };

$scope.callingblob=function(dataURL,btnId){
   
    console.log(btnId);
//var dataURL = .toDataURL('image/jpeg', 0.5);
var blob = $scope.dataURItoBlob(dataURL);
blob.name="img1.jpg";
var fd = new FormData(document.forms[0]);
fd.append("canvasImage", blob);
console.log(blob);
 //console.log(fd);
     $scope.uploadPic(blob,btnId);
   //  window.location.href="file:///D:/ANGULAR-SERVICES-INDEPTH/TraumaProject/test.html";
}

$scope.dataURItoBlob=function(dataURI) {
    // convert base64/URLEncoded data component to raw binary data held in a string
    var byteString;
    console.log(dataURI)
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to a typed array
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], {type:mimeString});
}

    $scope.uploadPic = function(file,btnId) {
        console.log(btnId);
      if(btnId=='loc')  {
            file.upload = Upload.upload({
            url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/loc/E100001',
            data: {username: $scope.username, file: file},
      
            });
      }
      else if(btnId=='ct_scan_head')  {
          file.upload = Upload.upload({
              url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/ct_scan_head/Ec100015',
              data: {username: $scope.username, file: file},
        
              });
        }
      else if(btnId=='xray_details')  {
          file.upload = Upload.upload({
              url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/xray_details/Ec100015',
              data: {username: $scope.username, file: file},
        
              });
        }
      else if(btnId=='mngmt_plan')  {
          file.upload = Upload.upload({
              url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/mngmt_plan/Ec100015',
              data: {username: $scope.username, file: file},
        
              });
        }
      else if(btnId=='course_in_hospital')  {
          file.upload = Upload.upload({
              url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/course_in_hospital/Ec100015',
              data: {username: $scope.username, file: file},
        
              });
        }
      else if(btnId=='condition_at_discharge')  {
          file.upload = Upload.upload({
              url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/uploadScribble/condition_at_discharge/Ec100015',
              data: {username: $scope.username, file: file},
        
              });
        }
      else{
          file.upload = Upload.upload({
            url: 'http://172.16.81.23:8080/NIMHANSproject/Services/encounterAction/upload/P100005',
            data: {username: $scope.username, file: file},
      
            });
      }
   // console.log(data);
    console.log(file);
    file.upload.then(function (response) {
      $timeout(function () {
        file.result = response.data;
      });
    }, function (response) {
      if (response.status > 0)
        $scope.errorMsg = response.status + ': ' + response.data;
    }, function (evt) {
      // Math.min is to fix IE which reports 200% sometimes
      file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
    });
    }
}]);
