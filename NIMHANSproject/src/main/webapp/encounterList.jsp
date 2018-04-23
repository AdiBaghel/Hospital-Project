<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>
<html ng-app="EncounterList">
<head>
    <meta charset="UTF-8">
   
    <title>Encounter List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	
	<link href="bootstrap/test1.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap/slider.css">
  <link rel="stylesheet" href="bootstrap/test1.css">
	<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/slider.js"></script>
	<script src="bootstrap/test1.js"></script>
	<script src="angular.js"></script>
	<script src="encounterList_NG.js"></script>
	<script src="GlobalURL.js"></script>
	

 <!-- Custom Fonts -->
  <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
 <style>
  a {
    color:darkgrey;
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


<body style="background-color:#eceff1;">
<div class="container-fluid"  >
 <div class="row">
<div class="col-sm-1">

<img src="images/nms.jpg"> 

</div>
<div class="col-sm-11">
 <h1>National Institute Of Mental Health And Neurosciences</h1>

</div> 
</div> 
</div>
<div class="container-fluid" style="background-color: #455a64" >
<nav>
	<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" style="background-color: darkgrey;" data-toggle="collapse" data-target="#bs-menu-navbar-collapse-1" aria-expanded="false">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
      		</button>
		</div>

	<div class="collapse navbar-collapse" id="bs-menu-navbar-collapse-1">
		<ul class="nav navbar-nav"  >
   			<li ><a href="doctorHome.jsp">Home</a></li>
  		</ul>
  		
  		
  		<ul class="nav navbar-right navbar-nav">
  				<form class="navbar-form navbar-left" role="search">
  				
				</form>
                
				
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Dr. <%=uname%> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
  		
 	</div>
 	 	
</nav>  
</div>



<div class="container-fluid">
           
           

       <!---sidebar-->
           

		
		   
		<div class="col-md-10 col-sm-10" ng-controller="EncounterListCtrl">    

		  <!--<div class="col-md-12 col-sm-12" align="right">
			<button class="btn btn-primary" onclick="window.location='traumaForm.html'"style="font-size: 20px; font-weight: bold;">+</button>
		  </div>-->
		  <div class="jumbotron" style="background-color:white; min-height:594px;">
			
			<div>
				<div class="col-md-5 col-sm-5" align="left">
					<strong>Patient ID :</strong> {{patientInfo.pid}}<br>		
					<strong>Patient Name:</strong> {{patientInfo.pname}}
				</div>
				<div class="col-md-5 col-sm-5" align="right">
					<strong>Patient Age :</strong> {{patientInfo.age}}	<br>	
					<strong>Patient Gender:</strong> {{patientInfo.gender}}
				</div>
			</div>
			<br><br>
			<hr size="4" width="100%" noshade style="color:#000000"/>
			<div>
				<table class = "table table-striped">
					<tr>
					<th>No.</th>
					<th>Visit ID</th>
					<th>Doctor Name</th>
					<th>Start Date</th>
					</tr>
					
					<tr ng-repeat="y in encounters track by $index">
					<td><a href="#" ng-click="invokeTrauma(y.eid)">{{ $index +1 }}</a></td>
					<td><a href="#" ng-click="invokeTrauma(y.eid)">{{ y.eid }}</a></td>
					<td><a href="#" ng-click="invokeTrauma(y.eid)">{{ y.did }}</a></td>
					<td><a href="#" ng-click="invokeTrauma(y.eid)">{{ y.startDate }}</a></td>
					</tr>
				</table>
			</div>
			
			</div>
		</div>
</div>

</div>
           
 </div>
</div>    

<div class="footer navbar-fixed-bottom" style="background-color: #455a64">
     <p>Trauma Centre, NIMHANS, Bangalore-560029, India</p> 
</div>

 
</body>
</html>

