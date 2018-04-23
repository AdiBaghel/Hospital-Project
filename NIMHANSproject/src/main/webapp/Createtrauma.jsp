<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>
<html ng-app="createTrauma">

<head>
<meta charset="UTF-8">

<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="angular.js"></script>
<script src="signature_pad.min.js"></script>
<script src="signature.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload-shim.min.js"></script>
<!-- for no html5 browsers support -->
<script src="ng-file-upload-bower-12.2.13/ng-file-upload.min.js"></script>
<script src="upload.js"></script>
<script src="CreateTraumaApp.js"></script>
<script src="CreateTraumaController.js"></script>
<script src="CreateTraumaService.js"></script>
<script src="GlobalURL.js"></script>

<link rel="stylesheet" href="upload.css">

<!-- Custom Fonts -->
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style>
a {
	color: darkgrey;
	text-decoration: none;
}

.btn-info {
	color: darkgrey;
	background-color: #455a64;
	border-color: #455a64;
}

.navbar-header .navbar-toggle .icon-bar {
	background-color: black;
}
</style>

</head>

<body style="background-color: #eceff1;">
	<div class="container-fixed">
		<div class="row">
			<div class="col-sm-1">

				<img src="images/nms.jpg">

			</div>
			<div class="col-sm-11">
				<h1>National Institute Of Mental Health And Neurosciences</h1>

			</div>
		</div>
	</div>
	<div class="container-fluid" style="background-color: #455a64">
		<nav>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					style="background-color: darkgrey;" data-toggle="collapse"
					data-target="#bs-menu-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="bs-menu-navbar-collapse-1">
				<ul class="nav navbar-nav"  >
   					<li ><a href="doctorHome.jsp">Home</a></li>
  				</ul>

				<ul class="nav navbar-right navbar-nav">
					<form class="navbar-form navbar-left" role="search"></form>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> Dr. <%=uname%> <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
							</li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li>
                            	<a href="LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        	</li>
						</ul></li>
				</ul>

			</div>

		</nav>
	</div>

	<div class="container-fluid">

		<!---sidebar-->
		<div class="col-md-2 col-sm-2 innerForm-tab-menu">
			<br>

			<div class="list-group">
				<a href="#incidentForm" class="list-group-item active text-center">INCIDENT DETAILS</a> 
				<a href="#physicalForm" class="list-group-item text-center">PHYSICAL EXAMINATION</a>
				<a href="#neurologicalForm" class="list-group-item text-center">NEUROLOGICAL EXAMINATION</a>
				<a href="#clinicalForm" class="list-group-item text-center">CLINICAL EXAMINATON</a>
			</div>

		</div>

		<!---INCIDENT DATA FORM START-->
		
		<br>
		<div ng-controller="dbDataPostCtrl as ctrl">
			<div >
				<div class="col-xs-3" style="align: left"><strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.pData1.pname}}</label> &nbsp;</div>
				<div class="col-xs-3" style="align: centre"><strong>Patient Age :</strong> <label style="text-align: left">{{ctrl.pData1.age}}</label> &nbsp;</div>
				<div class="col-xs-3" style="align: right"><strong>Patient Gender:</strong> <label style="text-align: left">{{ctrl.pData1.gender}}</label> &nbsp;</div>
			</div>
		</div>
		
		<div id="newForm" class="col-md-10 col-sm-10" ng-controller="dbDataPostCtrl as ctrl">
			<div class="jumbotron"
				style="background-color: white; min-height: 1000px;">
				<div id="incidentForm" class="container-fluid" style="border: 1px solid black; border-radius: 20px;">
					<h3>
						<strong><u>INCIDENT DETAILS:</u></strong>
					</h3>
					<br>

					<form class="form-horizontal">

						<div class="media-body">
                            
							<div class="form-group">
								<label class="control-label col-sm-4" for="refer"
									style="text-align: left">Referred from:</label>
								<div class="col-sm-5">
									<input name="referred_from" type="text" class="form-control"
										id="referred_from" placeholder="Enter referred from" ng-model="ctrl.myData1.referredFrom">
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-4" for="date"

									style="text-align: left">Date and time of Examination:</label>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.dateOfExamination=ctrl.myData1.dateOfExamination | date : "longDate"}}</span>
									<input name="DOE" type="date" class="form-control"
										id="date_of_exam" ng-model="ctrl.myData1.dateOfExamination">
								</div>
								<div class="col-sm-2">
									<span ng-hide="true">{{ctrl.myData1.timeOfExamination=ctrl.myData1.timeOfExamination | date : "shortTime"}}</span>
									<input name="Time" type="time" class="form-control" id="time_of_exam"
										ng-model="ctrl.myData1.timeOfExamination">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="informant_name"
									style="text-align: left">Informant's Name:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="informant_name"
										placeholder="Enter informant's name" ng-model="ctrl.myData1.informantName">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" style="text-align: left">Informant's
									type:</label>
								<div class="col-sm-2" ng-model="ctrl.myData1.informantType">
									<label class="radio-inline"> <input name="infor-type"
										id="type-e" value="Eyewitness" type="radio"
										ng-model="ctrl.myData1.informantType" />Eyewitness
									</label>
								</div>
								<div class="col-sm-2">
									<label class="radio-inline"> <input name="infor-type"
										id="type-w" value="Hearsay" type="radio"
										ng-model="ctrl.myData1.informantType" />Hearsay
									</label>
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-4" for="date-of-injury"
									style="text-align: left">Date and time of injury:</label>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.dateOfInjury=ctrl.myData1.dateOfInjury | date : "longDate"}}</span>
									<input name="DOI" type="date" class="form-control"
										id="date_of_injury" ng-model="ctrl.myData1.dateOfInjury">
								</div>
								<div class="col-sm-2">
									<span ng-hide="true">{{ctrl.myData1.timeOfInjury=ctrl.myData1.timeOfInjury | date : "shortTime"}}</span>
									<input name="TOI" type="time" class="form-control"
										id="time_of_injury" ng-model="ctrl.myData1.timeOfInjury">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="place of injury"
									style="text-align: left">Place of Injury:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="place-of-injury"
										placeholder="Enter place of injury" ng-model="ctrl.myData1.placeOfInjury">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="history"
									style="text-align: left">History of injury in detail:</label>
								<div class="col-sm-5">
									<ul class="list-group">
										<li class="list-group-item">Incident:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-rta" value="RTA" type="radio"
														ng-model="ctrl.myData1.incidentScenario" />RTA
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-fall" value="Fall" type="radio"
														ng-model="ctrl.myData1.incidentScenario" />Fall
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-assault" value="Assault" type="radio"
														ng-model="ctrl.myData1.incidentScenario" />Assault
													</label>
												</div>
												<div class="col-sm-2">
													<label class="radio-inline"> <input name="incident"
														id="input-other" value="Other" type="radio"
														ng-model="ctrl.myData1.incidentScenario" />Other
													</label>
												</div>
											</div>

										</li>
										<li class="list-group-item">Victim Type:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="victim"
														id="input-driver" value="Driver" type="radio" 
														ng-model="ctrl.myData1.victimType"/>Driver
													</label>
												</div>
												<div class="col-sm-4">
													<label class="radio-inline"> <input name="victim"
														id="input-pass" value="Passenger" type="radio"
														ng-model="ctrl.myData1.victimType" />Passenger
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="victim"
														id="input-pedest" value="Pedestrian" type="radio" 
														ng-model="ctrl.myData1.victimType" />Pedestrian
													</label>
												</div>

											</div>

										</li>
										<li class="list-group-item">Helmet:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="helmet"
														id="input-yes" value="true" type="radio" 
														ng-model="ctrl.myData1.helmet"/>Yes
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="helmet"
														id="input-no" value="false" type="radio"
														ng-model="ctrl.myData1.helmet" />No
													</label>
												</div>
											</div>

										</li>
										<li class="list-group-item">Alcohol Intake:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="alcohol"
														id="input-yes" value="true" type="radio" 
														ng-model="ctrl.myData1.alcoholIntake" />Yes
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="alcohol"
														id="input-no" value="false" type="radio" 
														ng-model="ctrl.myData1.alcoholIntake" />No
													</label>
												</div>
											</div>

										</li>
									</ul>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-3" data-ng-init="patientbtnId='form1';">
									<button type="button" class="btn btn-primary ">Save</button>
                                	<button data-ng-attr-id="patientbtnId" type="button" class="btn btn-success " ng-click="ctrl.confirmSubmit(patientbtnId);">Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>

				<!--INCIDENT DATA FORM END-->
				<br>
						<!--PHYSICAL EXAMINATION FORM START-->
                <div id="physicalForm" class="container-fluid" style="border:1px solid black; border-radius: 20px;">
                    <h3><strong><u>PHYSICAL EXAMINATION:</u></strong></h3>
                    <br>
                    <form class="form-horizontal">
                         <div class="form-group">
                            
                           <div class="col-sm-12" >
                            <label class="control-label" for="history" style="text-align: left">History of injury in detail:</label>
                           
                               <div>   
                                <input type="checkbox" ng-model="ctrl.myData2.lossOfConsciousness" ng-true-value="true" ng-false-value="false"/>Loss Of Consciousness
                                   
                                <div class="container-fluid" data-ng-init="phybtnId1='pt1';" >
                                <div>
                            		
                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId1" ng-click="ctrl.showTextAreaPhysical(phybtnId1)" ng-show="ctrl.myData2.lossOfConsciousness">Textarea</button>	
                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId1" ng-click="ctrl.showTouchPadPhysical(phybtnId1)" ng-show="ctrl.myData2.lossOfConsciousness">Touchpad</button>
								 
								</div><!-- buttons closed -->
								<div >
									<textarea ng-show="ctrl.myData2.lossOfConsciousness && !ctrl.myData2.locFlag;" class="form-control" rows="5" id="locText" ng-model="ctrl.myData2.locDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								<div  >
									<!-- This is called while doing post request of loc scribble-->
									<div ng-show="ctrl.myData2.lossOfConsciousness && ctrl.myData2.locFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch1=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>
										</div>
									</div> 
									
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div><!-- loc closed -->
                     
                          <br>
                           
                               <div>   
                                <input type="checkbox" ng-model="ctrl.myData2.lucidInterval" ng-true-value="true" ng-false-value="false">Lucid Interval
                                
                                 <!--  true is assigned to val2 when checkbox is checked and in this case "true" is assigned to ng-true-value and "false" is assigned to ng-false-value-->  
                                <div class="container-fluid" data-ng-init="phybtnId2='pt2';" >
                                <div>
                            		
                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId2" ng-click="ctrl.showTextAreaPhysical(phybtnId2)" ng-show="ctrl.myData2.lucidInterval">Textarea</button>	
                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId2" ng-click="ctrl.showTouchPadPhysical(phybtnId2)" ng-show="ctrl.myData2.lucidInterval">Touchpad</button>
								 
								</div><!--textarea and touchpad buttons closed -->
								
								<div  >
									<textarea ng-show="ctrl.myData2.lucidInterval && !ctrl.myData2.lucidFlag;" class="form-control" rows="5" id="lucidText" ng-model="ctrl.myData2.lucidDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								
								<div>
									<div ng-show="ctrl.myData2.lucidInterval && ctrl.myData2.lucidFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch2=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>					
										</div>
									</div>
									
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div><!-- lucid division closed -->  
                                <br>
                       
                               <div>   
                                <input type="checkbox" ng-model="ctrl.myData2.seizures" ng-true-value="true" ng-false-value="false"/>Seizures
                                   
                                <div class="container-fluid" data-ng-init="phybtnId3='pt3';" >
                                <div>
                            		
                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId3" ng-click="ctrl.showTextAreaPhysical(phybtnId3)" ng-show="ctrl.myData2.seizures">Textarea</button>	
                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId3" ng-click="ctrl.showTouchPadPhysical(phybtnId3)" ng-show="ctrl.myData2.seizures">Touchpad</button>
								 
								</div><!-- buttons closed -->
								
								<div >
									<textarea ng-show="ctrl.myData2.seizures && !ctrl.myData2.seizureFlag;" class="form-control" rows="5" id="seizureText" ng-model="ctrl.myData2.seizuresDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								
								<div  >
									 <div ng-show="ctrl.myData2.seizures && ctrl.myData2.seizureFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch3=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>
										</div>
									</div>
									
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div>      <!-- seizure division closed -->  
                          
                                <br>
                                
                              <div>   
                                <input type="checkbox" ng-model="ctrl.myData2.vomiting" ng-true-value="true" ng-false-value="false"/>Vomiting
                                   
                                <div class="container-fluid" data-ng-init="phybtnId4='pt4';" >
                                <div>
                            		
                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId4" ng-click="ctrl.showTextAreaPhysical(phybtnId4)" ng-show="ctrl.myData2.vomiting">Textarea</button>	
                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId4" ng-click="ctrl.showTouchPadPhysical(phybtnId4)" ng-show="ctrl.myData2.vomiting">Touchpad</button>
								 
								</div><!-- buttons closed -->
								
								<div  >
									<textarea ng-show="ctrl.myData2.vomiting && !ctrl.myData2.vomitingFlag;" class="form-control" rows="5" id="vomitingText" ng-model="ctrl.myData2.vomitingDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								
								<div >
									<div ng-show="ctrl.myData2.vomiting && ctrl.myData2.vomitingFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch4=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>  
										</div>
									</div>
									
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div>      <!-- vomiting division closed -->  
                           
                                <br>
                                
                               <div>   
                                <input type="checkbox" ng-model="ctrl.myData2.amnesia" ng-true-value="true" ng-false-value="false" />Amnesia
                                   
                                <div class="container-fluid" data-ng-init="phybtnId5='pt5';" >
                                <div>
                            		
                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId5" ng-click="ctrl.showTextAreaPhysical(phybtnId5)" ng-show="ctrl.myData2.amnesia">Textarea</button>	
                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId5" ng-click="ctrl.showTouchPadPhysical(phybtnId5)" ng-show="ctrl.myData2.amnesia">Touchpad</button>
								 
								</div><!-- buttons closed -->
								
								<div >
									<textarea ng-show="ctrl.myData2.amnesia && !ctrl.myData2.amnesiaFlag;" class="form-control" rows="5" id="amnesiaText" ng-model="ctrl.myData2.amnesiaDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								
								<div>
									<div ng-show="ctrl.myData2.amnesia && ctrl.myData2.amnesiaFlag;"   ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch5=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button> 
										</div>
									</div>
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div>      <!-- amnesia division closed -->           
                               
                               <br>
                                
                            <div>
                               Bleeding from:
                               <input type="checkbox" ng-model="ctrl.myData2.bleedingFromEar" ng-true-value="true" ng-false-value="false"/> Ear
                               <input type="checkbox"  ng-model="ctrl.myData2.bleedingFromNose" ng-true-value="true" ng-false-value="false" /> Nose   
                               <div class="container-fluid" data-ng-init="phybtnId6='pt6';" >
                                	<div>
                            			<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId6" ng-click="ctrl.showTextAreaPhysical(phybtnId6)" ng-show="ctrl.myData2.bleedingFromEar || ctrl.myData2.bleedingFromNose">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId6" ng-click="ctrl.showTouchPadPhysical(phybtnId6)" ng-show="ctrl.myData2.bleedingFromEar || ctrl.myData2.bleedingFromNose">Touchpad</button>
							
								</div><!-- buttons closed -->
								
								<div >
									<textarea ng-show="(ctrl.myData2.bleedingFromEar || ctrl.myData2.bleedingFromNose) && !ctrl.myData2.bleedingFromFlag;" class="form-control" rows="5" id="bleedingFrmText" ng-model="ctrl.myData2.bleedingFromDescription" placeholder="Description" style="width: 100%"></textarea>
								</div><!-- textarea closed -->
								
								<div>
									<div ng-show="(ctrl.myData2.bleedingFromEar || ctrl.myData2.bleedingFromNose) && ctrl.myData2.bleedingFromFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ptouch6=dataurl}}</span>
										<div class="buttons" >
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>  
										</div>
									</div>
									
								</div><!-- touchpad closed -->
							</div><!-- container closed -->
                          </div><!-- bleedingfrom division closed -->  
                             
                            </div>
                       </div>
                       
                       <div class="form-group">
                            <div>
                            <label class="control-label col-sm-12" style="text-align: left">Vital signs on Arrival:</label>
                            </div>
                            <br>
                            <div class="col-sm-12">
                                <ul class="list-group">
                                    <li class="list-group-item"><strong>Airway on arrival:</strong>
                                        <div class="container-fluid">
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="airway" id="type-c" ng-model="ctrl.myData2.airwayOnArrival" value="Clear" type="radio" />Clear
                                                </label>
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="airway" id="type-r" ng-model="ctrl.myData2.airwayOnArrival" value="Requires Intubation" type="radio" />Requires Intubation
                                                </label>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="list-group-item"><strong>Spontaneous Respiration</strong>
                                        <div class="container-fluid">
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="Spontaneous" id="type-c" ng-model="ctrl.myData2.spontaneousRespiration" value="Normal" type="radio" />Normal
                                                </label>
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="Spontaneous" id="type-r" ng-model="ctrl.myData2.spontaneousRespiration" value="Tachypnoeic" type="radio" />Tachypnoeic
                                                </label>
                                            </div>
                                             <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="Spontaneous" id="type-g" ng-model="ctrl.myData2.spontaneousRespiration" value="Gasping" type="radio" />Gasping
                                                </label>
                                            </div>
                                        </div>
                                    </li>

									<li class="list-group-item"><strong>Carotid Pulsations</strong>
                                        <div class="container-fluid">
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="Carotid" id="type-ctr" ng-model="ctrl.myData2.carotidPulsation" value="Right" type="radio" />Right
                                                </label>
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input name="Carotid" id="type-ctl" ng-model="ctrl.myData2.carotidPulsation" value="Left" type="radio" />Left
                                                </label>
                                            </div>
                                        </div>
                                    </li>
									
                                    <li class="list-group-item ">
                                    <div class="container-fluid">
                                    <label class="col-sm-4"><strong>Pulse Rate(/min):</strong></label>
                                   
                                    <div class="col-sm-4">
                                     <input type="text" class="form-control" id="pulse" ng-model="ctrl.myData2.pulseRrate ">
                                    </div> 
                                    
                                      </div>
                                    </li>

                                    <li class="list-group-item">
                                    <div class="container-fluid">
                                     <label class="col-sm-4"><strong>Blood Pressure on Arrival(/mmHg):</strong></label>
                                      <div class="col-sm-4">
                                       <input type="text" class="form-control" id="bp" ng-model="ctrl.myData2.bpOnArrival ">
                                     </div>   
                                     </div>
                                    </li>
                                    
                                     <li class="list-group-item">
                                      <div class="container-fluid">
                                       <label class="col-sm-4"><strong>Blood Pressure After Half Hour(/mmHg):</strong></label>
                                        <div class="col-sm-4">
                                        <input type="text" class="form-control" id="bpafter" ng-model="ctrl.myData2.bpAfterHalfHour ">
                                    	 </div>
                                    	 </div>
									 </li>
								</ul>

                            </div>
                        </div>
                        
                       	<div class="form-group col-sm-12">
                            <label class="control-label col-sm-12" style="text-align: left">Systemic Examination:</label>
                              <div>
                              	<div class="col-sm-4">
                                	<label class="radio-inline">
                                    	<input name="csf" id="type-r" value="Rhinorrhoea" type="radio" ng-model="ctrl.myData2.csf" ng-true-value="true" ng-false-value="false" />Rhinorrhoea
                                 	</label>
                               	</div>
                                <div class="col-sm-4">
                                	<label class="radio-inline">
                                    	<input name="csf" id="type-o" value="Otorrhoea" type="radio" ng-model="ctrl.myData2.csf" ng-true-value="true" ng-false-value="false"/> Otorrhoea
                                   	</label>
                                </div>
                                <div class="col-sm-4">
                                 	<label class="radio-inline">
                                    	<input name="csf" id="type-b" value="Both" type="radio" ng-model="ctrl.myData2.csf" ng-true-value="true" ng-false-value="false"/> Both
                                    </label>
                                </div>
                                <div class="container-fluid" data-ng-init="phybtnId7='pt7';" >
                                	<div>
                            			<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId7" ng-click="ctrl.showTextAreaPhysical(phybtnId7)" ng-show="ctrl.myData2.csf">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId7" ng-click="ctrl.showTouchPadPhysical(phybtnId7)" ng-show="ctrl.myData2.csf">Touchpad</button>
								 	</div>
									<div>
										<textarea ng-show="ctrl.myData2.csf && !ctrl.myData2.csfFlag;" class="form-control" rows="5" id="csfText" ng-model="ctrl.myData2.csfDesc" placeholder="Description" style="width: 100%"></textarea>
									</div>
									<div >
										<div ng-show="ctrl.myData2.csf && ctrl.myData2.csfFlag"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch7=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!--container closed  -->
                          	</div> <!-- csf division closed --> 
                       
                                        
                           	<div>   
                               	<input type="checkbox" id="type-apb" value="Active peripheral Bleeding" ng-model="ctrl.myData2.activePeripheralBleeding" ng-true-value="true" ng-false-value="false"  />Active peripheral Bleeding
                                <div class="container-fluid" data-ng-init="phybtnId8='pt8';" >
                                	<div>
                            			<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId8" ng-click="ctrl.showTextAreaPhysical(phybtnId8)" ng-show="ctrl.myData2.activePeripheralBleeding">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId8" ng-click="ctrl.showTouchPadPhysical(phybtnId8)" ng-show="ctrl.myData2.activePeripheralBleeding">Touchpad</button>
								 	</div><!-- buttons closed -->
								
									<div>
										<textarea ng-show="ctrl.myData2.activePeripheralBleeding && !ctrl.myData2.activePeripheralBleedingFlag;" class="form-control" rows="5" id="apbText" ng-model="ctrl.myData2.activePeripheralBleedingDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
								
									<div>
										<div ng-show="ctrl.myData2.activePeripheralBleeding && ctrl.myData2.activePeripheralBleedingFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch8=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!-- active peripheral bleeding division closed -->  
                                        
                            <div>   
                                <input type="checkbox" id="type-fracture" value="Fractures" ng-model="ctrl.myData2.fractures" ng-true-value="true" ng-false-value="false" />Fractures
                                <div class="container-fluid" data-ng-init="phybtnId9='pt9';" >
                                	<div>
	                            		<button type="button" class="btn btn-info " data-ng-attr-id="phybtnId9" ng-click="ctrl.showTextAreaPhysical(phybtnId9)" ng-show="ctrl.myData2.fractures">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId9" ng-click="ctrl.showTouchPadPhysical(phybtnId9)" ng-show="ctrl.myData2.fractures">Touchpad</button>
								 	</div><!-- buttons closed -->
									
									<div>
										<textarea ng-show="ctrl.myData2.fractures && !ctrl.myData2.fracturesFlag;" class="form-control" rows="5" id="fractureText" ng-model="ctrl.myData2.fracturesDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
									
									<div>
										<div ng-show="ctrl.myData2.fractures && ctrl.myData2.fracturesFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch9=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!-- fractures division closed -->            
                                                
                            <div>   
                            	<input type="checkbox" id="type-pp" value="Peripheral Pulses" ng-model="ctrl.myData2.peripheralPulses" ng-true-value="true" ng-false-value="false"  />Peripheral Pulses
                                <div class="container-fluid" data-ng-init="phybtnId10='pt10';" >
                                	<div>
                            			<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId10" ng-click="ctrl.showTextAreaPhysical(phybtnId10)" ng-show="ctrl.myData2.peripheralPulses">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId10" ng-click="ctrl.showTouchPadPhysical(phybtnId10)" ng-show="ctrl.myData2.peripheralPulses">Touchpad</button>
								 	</div><!-- buttons closed -->
									
									<div >
										<textarea ng-show="ctrl.myData2.peripheralPulses && !ctrl.myData2.peripheralPulsesFlag;" class="form-control" rows="5" id="fractureText" ng-model="ctrl.myData2.peripheralPulsesDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
								
									<div >
										<div ng-show="ctrl.myData2.peripheralPulses && ctrl.myData2.peripheralPulsesFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch10=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!--peripheral pulses division closed -->            
          
                            <div>   
                                <input type="checkbox" id="type-ci" value="Chest Injury" ng-model="ctrl.myData2.chestInjury" ng-true-value="true" ng-false-value="false"  />Chest Injury
                                <div class="container-fluid" data-ng-init="phybtnId11='pt11';" >
                                	<div>
                            			<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId11" ng-click="ctrl.showTextAreaPhysical(phybtnId11)" ng-show="ctrl.myData2.chestInjury">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId11" ng-click="ctrl.showTouchPadPhysical(phybtnId11)" ng-show="ctrl.myData2.chestInjury">Touchpad</button>
									</div><!-- buttons closed -->
								
									<div>
										<textarea ng-show="ctrl.myData2.chestInjury && !ctrl.myData2.chestInjuryFlag;" class="form-control" rows="5" id="chestinjuryText" ng-model="ctrl.myData2.chestInjuryDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
									
									<div >
										<div ng-show="ctrl.myData2.chestInjury && ctrl.myData2.chestInjuryFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch11=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!-- chest injury division closed --> 
                                   
                            <div>   
                            	<input type="checkbox" id="type-ai" value="Abdominal Injury" ng-model="ctrl.myData2.abdominalInjury" ng-true-value="true" ng-false-value="false"  />Abdominal Injury
                                <div class="container-fluid" data-ng-init="phybtnId12='pt12';" >
	                                <div>
	                            		<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId12" ng-click="ctrl.showTextAreaPhysical(phybtnId12)" ng-show="ctrl.myData2.abdominalInjury">Textarea</button>	
	                                    <button type="button" class="btn btn-info" data-ng-attr-id="phybtnId12" ng-click="ctrl.showTouchPadPhysical(phybtnId12)" ng-show="ctrl.myData2.abdominalInjury">Touchpad</button>
									</div><!-- buttons closed -->
									
									<div >
										<textarea ng-show="ctrl.myData2.abdominalInjury && !ctrl.myData2.abdominalInjuryFlag;" class="form-control" rows="5" id="abdominalInjuryText" ng-model="ctrl.myData2.abdominalInjuryDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
									
									<div>
										<div ng-show="ctrl.myData2.abdominalInjury && ctrl.myData2.abdominalInjuryFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch12=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!-- abdominal injury division closed --> 
                                      
                           	<div>   
                            	<input type="checkbox" id="type-w" value="Abdominal Injury" ng-model="ctrl.myData2.wounds" ng-true-value="true" ng-false-value="false" />Wounds
                                <div class="container-fluid" data-ng-init="phybtnId13='pt13';" >
                                	<div>
                            			<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId13" ng-click="ctrl.showTextAreaPhysical(phybtnId13)" ng-show="ctrl.myData2.wounds">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId13" ng-click="ctrl.showTouchPadPhysical(phybtnId13)" ng-show="ctrl.myData2.wounds">Touchpad</button>
								 	</div><!-- buttons closed -->
									
									<div >
										<textarea ng-show="ctrl.myData2.wounds && !ctrl.myData2.woundsFlag;" class="form-control" rows="5" id="woundsText" ng-model="ctrl.myData2.woundsDesc" placeholder="Description" style="width: 100%"></textarea>
									</div><!-- textarea closed -->
								
									<div >
										<div ng-show="ctrl.myData2.wounds && ctrl.myData2.woundsFlag;"  ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch13=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
										</div>
									</div><!-- touchpad closed -->
								</div><!-- container closed -->
                          	</div><!-- wounds division closed -->             
                         </div>
                        
                            <div class="form-group">
                            	<label class="control-label col-sm-12" style="text-align: left">Details Of Spine Examination:</label>
                                <div class="col-sm-4">
                                	<label class="radio-inline">
                                    	<input type="checkbox" id="type-t" value="Spinal Tenderness" ng-model="ctrl.myData2.spinalTenderness" ng-true-value="true" ng-false-value="false" />Spinal Tenderness
                                    </label>
                            	</div>
                                
                                <div class="col-sm-4">
                                	<label class="radio-inline">
                                    	<input type="checkbox" id="type-d" value="Spinal Deformity" ng-model="ctrl.myData2.spinalDeformity" ng-true-value="true" ng-false-value="false"/>Spinal Deformity
                                    </label>
                              	</div>
                                       
                                <div class="container-fluid" data-ng-init="phybtnId14='pt14';" >
                                	<div>
                            			<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId14" ng-click="ctrl.showTextAreaPhysical(phybtnId14)" ng-show="ctrl.myData2.spinalTenderness || ctrl.myData2.spinalDeformity">Textarea</button>	
                                    	<button type="button" class="btn btn-info" data-ng-attr-id="phybtnId14" ng-click="ctrl.showTouchPadPhysical(phybtnId14)" ng-show="ctrl.myData2.spinalTenderness || ctrl.myData2.spinalDeformity">Touchpad</button>
								 	</div>
								
									<div>
										<textarea ng-show="(ctrl.myData2.spinalTenderness || ctrl.myData2.spinalDeformity) && !ctrl.myData2.spinalFlag;" class="form-control" rows="5" id="spinalText" ng-model="ctrl.myData2.spinalDesc" placeholder="Description" style="width: 100%"></textarea>
									</div>
								
									<div>
										<div ng-show="(ctrl.myData2.spinalTenderness || ctrl.myData2.spinalDeformity) && ctrl.myData2.spinalFlag;" ng-controller="MyCtrl" class="modal-body " ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
											<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
											<span ng-hide="true">{{ctrl.ptouch14=dataurl}}</span>
											<div class="buttons">
												<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
											</div>
*+										</div>
									</div><!-- touchpad closed -->
								</div><!--container closed  -->
							</div> <!-- spinal division closed --> 
                         
                          
                        <div class="form-group">
                          	<div class="col-sm-offset-4 col-sm-3" data-ng-init="physicalbtnId='form2';">
                                <button type="button" class="btn btn-primary ">Save</button>
                                <button data-ng-attr-id="physicalbtnId" type="button" class="btn btn-success " ng-click="ctrl.confirmSubmit(physicalbtnId)">Submit</button>
                            </div>
                     	</div>                     
                    </form>
                </div>
				<!--PHYSICAL EXAMINATION FORM END-->

				<br>
				
				<!--NEUROLOGICAL EXAMINATION FORM START-->
				<div id="neurologicalForm" class="container-fluid" style="border: 1px solid black; border-radius: 20px;">
					<form class="form-horizontal">

						<div class="form-group">
							<h3 class="control-label col-xs-6" style="text-align: left">
								<strong><u>NEUROLOGICAL EXAMINATION</u></strong>
							</h3>
						</div>
						<br>

						<div class="form-group">
							<label class="control-label col-xs-10" style="text-align: left">
							Details of sensorium initially and after primary resuscitation(write appropriate score)</label>
						</div>

						<div class="form-group">
							<h4 class="control-label col-xs-6" style="text-align: centre">
								<b>Glasgow Coma Scale</b>
							</h4>
						</div>

						<div class="form-group">
							<label class="control-label col-xs-4" style="text-align: left; padding-left: 50px;">
								Eye Openeing Score : 
							</label>
						</div>

					  <div>
						<div class="form-group" style="text-align: left; padding-left: 50px; float:left;">
							<label class="control-label col-xs-4" style="text-align: left; float:left">
							    Initial
							</label>
							<div  class = "col-xs-8">
								<select class="form-control" id="scoreEyeInitial" ng-model="ctrl.myData3.eyeOpeneingScoreInitial">
									<option value="4">4 - Spontaneously</option>
									<option value="3">3 - To verbal command</option>
									<option value="2">2 - To pain</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left; padding-right: 50px; padding-left: 50px;float:right;">
							<label class="control-label col-xs-5" style="text-align: left; float:left">
								After resuscitation
							</label>
							
							<div class="col-xs-7">
								<select class="form-control" id="scoreEyeAfter" ng-model="ctrl.myData3.eyeOpeningScoreAfterRes">
									<option value="4">4 - Spontaneously</option>
									<option value="3">3 - To verbal command</option>
									<option value="2">2 - To pain</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
					  </div>
						
						<br><br>
						
						<div class="form-group">
							<label class="control-label col-xs-4" style="text-align: left; padding-left: 50px;">
								Motor Response Score : 
							</label>
						</div>
						
						<div>
						<div class="form-group" style="text-align: left; padding-left: 50px; float:left;">
							<label class="control-label col-xs-4" style="text-align: left; float:left">
							    Initial
							</label>

							<div class = "col-xs-8">
								<select class="form-control" id="scoreMotorResponseInitial" ng-model="ctrl.myData3.motorResponseScoreInitial">
									<option value="6">6 - Obeys</option>
									<option value="5">5 - Localise pain</option>
									<option value="4">4 - Flexian Withdrawal</option>
									<option value="3">3 - Decorticate</option>
									<option value="2">2 - Decerebrate</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left; padding-right: 50px; padding-left: 50px;float:right;">
							<label class="control-label col-xs-5" style="text-align: left; float:left">
								After resuscitation
							</label>

							<div class="col-xs-7">
								<select class="form-control" id="scoreMotorResponseAfter" ng-model="ctrl.myData3.motorResponseScoreAfterRes">
									<option value="6">6 - Obeys</option>
									<option value="5">5 - Localise pain</option>
									<option value="4">4 - Flexian Withdrawal</option>
									<option value="3">3 - Decorticate</option>
									<option value="2">2 - Decerebrate</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
						</div>
						
						<br><br>
						
						<div class="form-group">
							<label class="control-label col-xs-4" style="text-align: left; padding-left: 50px;">
								Response Score : 
							</label>
						</div>
						
						<div>
						<div class="form-group" style="text-align: left; padding-left: 50px; float:left;">
							<label class="control-label col-xs-4" style="text-align: left; float:left">
							    Initial
							</label>
						
							<div class = "col-xs-8">
								<select class="form-control"id="scoreVerbalResponseInitial" ng-model="ctrl.myData3.verbalResponseScoreInitial">
									<option value="5">5 - Oriented</option>
									<option value="4">4 - Disoriented</option>
									<option value="3">3 - Inappro Words</option>
									<option value="2">2 - Incomprehensible sounds</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
						
						<div class="form-group" style="text-align: left; padding-right: 50px; padding-left: 50px;float:right;">
							<label class="control-label col-xs-5" style="text-align: left; float:left">
								After resuscitation
							</label>

							<div class="col-sm-7">
								<select class="form-control" id="scoreVerbalResponseAfter" ng-model="ctrl.myData3.verbalResponseScoreAfterRes">
									<option value="5">5 - Oriented</option>
									<option value="4">4 - Disoriented</option>
									<option value="3">3 - Inappro Words</option>
									<option value="2">2 - Incomprehensible sounds</option>
									<option value="1">1 - No response</option>
								</select>
							</div>
						</div>
						</div>
						<br><br>
						
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Horizontal oculocephalic reflex
							</label>
							<br><br>
							
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"
									style="text-align: left; padding-right: 1em;">Right : 
								</label>
								<label class="radio-inline"> <input type="radio" name="radioHRight"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-true-value="present" value="present">Present
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioHRight"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-true-value="absent" value="absent">Absent
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioHRight"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-true-value="not_tested" value="not_tested">Not Tested
								</label>
							</div>
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2" style="text-align: left; padding-right: 1em;">
								Left : 
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioHLeft"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
									ng-true-value="present" value="present">
									Present
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioHLeft"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
									ng-true-value="absent" value="absent">Absent
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioHLeft"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
									ng-true-value="not_tested" value="not_tested">
									Not Tested
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Pupilliary Light reflex
							</label> <br><br>
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"	style="text-align: left; padding-right: 1em;">
									Right : 
								</label>
								<label class="radio-inline"> <input type="radio" name="radioPRight" 
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-true-value="normal" value="normal">
									Normal
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioPRight" 
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-true-value="sluggish" value="sluggish">
									Sluggish
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioPRight" 
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-true-value="absent" value="absent">
									Absent
								</label> <label class="radio-inline"> <input type="radio" name="radioPRight" 
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-true-value="cannot_access" value="cannot_access">
									Cannot Access
								</label>
							</div>
							
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2" style="text-align: left; padding-right: 1em;">
								Left : 
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioPLeft" 
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-true-value="normal" value="normal">
									Normal
								</label> 
								<label class="radio-inline"> <input type="radio" name="radioPLeft" 
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-true-value="sluggish" value="sluggish">
									Sluggish
								</label> <label class="radio-inline"> <input type="radio" name="radioPLeft" 
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-true-value="sluggish" value="sluggish">
									Absent
								</label> <label class="radio-inline"> <input type="radio" name="radioPLeft" 
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-true-value="sluggish" value="sluggish">
									Cannot Access
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Motor System Examination</label>
						</div>

						<div class="form-group" style="padding-left: 5em;">
							<div class="container-fluid">

								<div class="row">
									<div class="col-xs-2 "></div>
									<div class="col-xs-5 ">
										<label class="control-label" style="text-align: left">Right</label>
									</div>
									<div class="col-xs-5 ">
										<label class="control-label" style="text-align: left">Left</label>
									</div>
								</div>

								<div class="row" style="padding-top: 1em;">
									<div class="col-xs-2">
										<label class="control-label" style="text-align: left">Upper: </label>
									</div>
									<div class="col-xs-5"style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label" style="text-align: left">Tone: </label> 
										<input type="text" class="form-control"	id="toneUpperRight" ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone">
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Tone: </label> 
										<input type="text " class="form-control" id="toneUpperLeft" ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone">
									</div>
								</div>

								<div class="row ">
								  <div class="col-xs-2 "></div>
									<div class="col-xs-5" style="background-color: lavender; padding-bottom: 1em;"">
										<label class="control-label" style="text-align: left">Power: </label> 
										<input type="text" class="form-control"id="powerUpperRight" ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower">
									</div>
									<div class="col-xs-5" style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Power: </label> 
										<input type="text " class="form-control" id="powerUpperRight" ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower">
									</div>
								</div>

								<div class="row " style="padding-top: 1em;">
									<div class="col-xs-2 ">
										<label class="control-label " style="text-align: left">Lower: </label>
									</div>
									<div class="col-xs-5 "
										style="background-color: lavender; padding-bottom: 1em;"">
										<label class="control-label" style="text-align: left">Tone: </label> 
										<input type="text" class="form-control"	id="toneLowerRight" ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone">
									</div>
									<div class="col-xs-5" style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Tone: </label> 
										<input type="text" class="form-control"id="toneLowerLeft" ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone">
									</div>
								</div>
								
								<div class="row ">
									<div class="col-xs-2"></div>
									<div class="col-xs-5" style="background-color: lavender; padding-bottom: 1em;"">
										<label class="control-label" style="text-align: left">Power: </label> 
										<input type="text" class="form-control"	id="powerLowerRight" ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower">
									</div>
									<div class="col-xs-5" style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Power: </label>
										<input type="text" class="form-control"	id="powerLowerLeft"	ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower">
									</div>
								</div>

							</div>
						</div>

						<div class="form-group ">
						
								<label class="control-label col-sm-12 " style="text-align: left">
										Any other neurological deficits like carnial nerve or limb
									paralysis, sensory loss and bowel/bladder involvement :
								</label>
								<br><br>
								<div class="container-fluid" data-ng-init="nbtnId1='nt1';" >
                                <div>
                            		<button type="button" class="btn btn-info" data-ng-attr-id="nbtnId1" ng-click="ctrl.showTextarea(nbtnId1)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="nbtnId1" ng-click="ctrl.showTouchpad(nbtnId1)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData3.anyOtherNeurologicalDeficitsSketchpad;" class="form-control" rows="5" id="neurolo" ng-model="ctrl.myData3.anyOtherNeurologicalDeficits" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div ng-show="ctrl.myData3.anyOtherNeurologicalDeficitsSketchpad;">
									<div ng-controller="MyCtrl as ctrl2" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ntouch1=dataurl}}</span>
										<div class="buttons" >
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
									
								</div>
							</div>
						</div>

							<div class="form-group ">
								<div class="col-sm-offset-4 col-sm-3 "
									data-ng-init="neurobtnId='form3';">
									<button type="button " class="btn btn-primary ">Save</button>
									<button data-ng-attr-id="neurobtnId" type="button"
										class="btn btn-success " ng-click="ctrl.confirmSubmit(neurobtnId);">Submit</button>
								</div>
							</div>
					</form>

				</div>
				<!--NEUROLOGICAL EXAMINATION FORM END-->
				<br>
				<!--CLINICAL EXAMINATION FORM START-->
				<div id="clinicalForm" class="container-fluid " style="border:1px solid black; border-radius: 20px; ">
                        <h3><strong><u>CLINICAL EXAMINATION:</u></strong></h3>
                        <br>
						<form class="form-horizontal ">
                        <div class="form-group ">
                            <label class="control-label col-sm-4 " style="text-align: left ">Any change in GCS/Neurological examination noted during observation:</label>
                            <div class="container-fluid col-sm-5 ">
                                <div class="col-sm-6 ">
                                    <label class="radio-inline">
										<input type="radio" name="gcsExam" id="gcsExam1" value="1" ng-model="ctrl.myData4.anyChangeNeurological">Yes
									</label>
                                </div>
                                <div class="col-sm-4 ">
                                    <label class="radio-inline">
										<input type="radio" name="gcsExam" id="gcsExam2" value="0" ng-model="ctrl.myData4.anyChangeNeurological">No
									</label>
                                </div>
                            </div>
                        </div>
					
						<div class="form-group ">
                            <label class="control-label col-sm-4 " style="text-align: left ">CT scan head showed : </label>
                            <div class="container-fluid" data-ng-init="cbtnId1='ct1';" >
                                <div>
                            		<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId1" ng-click="ctrl.showTextarea(cbtnId1)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId1" ng-click="ctrl.showTouchpad(cbtnId1)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData4.ctScanHeadSketchPad;" class="form-control" rows="5" id="other" ng-model="ctrl.myData4.ctScanHead" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div>
									<div ng-show="ctrl.myData4.ctScanHeadSketchPad;" ng-controller="MyCtrl as ctrl2" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ctouch1=dataurl}}</span>
										<div class="buttons" data-ng-init="sbtnId1='ct_scan_head';">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
									
								</div>
							</div>
                        </div>
						
                        <div class="form-group ">
                            <div>
                            	<label class="control-label col-sm-4 " style="text-align: left ">Other relevant investigations(X-rays/MRI):</label>
                            </div>
                            <div class="container-fluid" data-ng-init="cbtnId2='ct2';">
                                <div>
                            		<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId2" ng-click="ctrl.showTextarea(cbtnId2)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId2" ng-click="ctrl.showTouchpad(cbtnId2)">Touchpad</button>
								</div>							
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData4.xrayDetailsSketchPad;" class="form-control" rows="5" id="other" ng-model="ctrl.myData4.xrayDetails" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div>
									<div ng-show="ctrl.myData4.xrayDetailsSketchPad;" ng-controller="MyCtrl" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ctouch2=dataurl}}</span>
										<div class="buttons" data-ng-init="sbtnId2='xray_details';">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
								</div>
                            </div>
                        </div>
                        
                        
                         <div class="form-group ">
                            <label class="control-label col-sm-4 " style="text-align: left ">Management Plan (in Hospital):</label>
                            <div class="container-fluid" data-ng-init="cbtnId3='ct3';">
                                <div>
                                   	<button type="button" class="btn btn-info " data-ng-attr-id="cbtnId3" ng-click="ctrl.showTextarea(cbtnId3)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId3" ng-click="ctrl.showTouchpad(cbtnId3)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData4.managementPlanSketchPad;" class="form-control" rows="5" id="other" ng-model="ctrl.myData4.managementPlan" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div>
									<div ng-show="ctrl.myData4.managementPlanSketchPad;" ng-controller="MyCtrl" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ctouch3=dataurl}}</span>
										<div class="buttons" data-ng-init="sbtnId3='mngmt_plan';">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
								</div> 
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-sm-4 " style="text-align: left ">Course in the Hospital(including repeat CT scan done, if any):</label>
                            <div class="container-fluid" data-ng-init="cbtnId4='ct4';">
                                <div>
                            		<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId4" ng-click="ctrl.showTextarea(cbtnId4)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId4" ng-click="ctrl.showTouchpad(cbtnId4)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData4.courseInHospitalSketchPad;" class="form-control" rows="5" id="other" ng-model="ctrl.myData4.courseInHospital" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div>
									<div ng-show="ctrl.myData4.courseInHospitalSketchPad;" ng-controller="MyCtrl" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ctouch4=dataurl}}</span>
										<div class="buttons" data-ng-init="sbtnId4='course_in_hospital';">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
								</div>               
                            </div>
                        </div>

                        <div class="form-group ">
                            <label class="control-label col-sm-4 " style="text-align: left ">Condition at Discharge:</label>
                            <div class="container-fluid " data-ng-init="cbtnId5='ct5';">
                                <div>
                            		<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId5" ng-click="ctrl.showTextarea(cbtnId5)">Textarea</button>
									<button type="button" class="btn btn-info" data-ng-attr-id="cbtnId5" ng-click="ctrl.showTouchpad(cbtnId5)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea ng-show="!ctrl.myData4.conditionAtDischargeSketchPad;" class="form-control" rows="5" id="other" ng-model="ctrl.myData4.conditionAtDischarge" placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div>
									<div ng-show="ctrl.myData4.conditionAtDischargeSketchPad;" ng-controller="MyCtrl" class="modal-body col-sm-12" ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept" style="border: 1px solid black;" clear="clear" height="220" width="568" dataurl="dataurl" ></signature-pad>
										<span ng-hide="true">{{ctrl.ctouch5=dataurl}}</span>
										<div class="buttons" data-ng-init="sbtnId5='condition_at_discharge';">
											<button type="button" class="btn btn-default" ng-click="clear()">Clear</button>               
										</div>
									</div>
								</div>
                            
                            
                            </div>
                        </div>

                        <div class="form-group " ng-controller="MyCtrl as ctrl2">
                        
                            <div class="col-sm-offset-4 col-sm-3" data-ng-init="clinicalbtnId='form4';">
                                <button type="button" class="btn btn-primary ">Save</button>
                                <button data-ng-attr-id="clinicalbtnId" type="button" class="btn btn-success " ng-click="ctrl.confirmSubmit(clinicalbtnId);">Submit</button>
                            </div>
                        
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>
	
<div class="footer navbar-fixed-bottom" style="background-color: #455a64">
     <p>Trauma Centre, NIMHANS, Bangalore-560029, India</p> 
</div>

</body>
</html>