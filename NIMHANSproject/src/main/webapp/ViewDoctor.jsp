<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>
<html ng-app="viewDoctor">

<head>
    <meta charset="UTF-8">

    <title>View Doctor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="angular.js"></script>
	<script src="ViewDoctor_NG.js"></script>
	<script src="GlobalURL.js"></script>
    <!-- Custom Fonts -->
    <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

<body style="background-color:#eceff1;">
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
                <button type="button" class="navbar-toggle collapsed" style="background-color: darkgrey;" data-toggle="collapse" data-target="#bs-menu-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="bs-menu-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="adminHome.jsp">Home</a></li>
                </ul>

                <ul class="nav navbar-right navbar-nav">
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=uname%> <b class="caret"></b></a>
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

		<div id="newForm" class="col-md-10 col-sm-10" ng-controller="viewDoctorCtrl as ctrl">
            <div class="jumbotron" style="background-color:white; min-height:1000px;">
                <div class="container-fluid" style="border:1px solid black; border-radius: 20px;">
                    <h3><strong>VIEW DOCTOR</strong></h3>
                    <br>

                    <form class="form-horizontal">                    
                        
                      <div class="media-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4" style="text-align: left">Doctor ID : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="did" value="{{ctrl.dData.did}}" readonly>
                            </div>
                   
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Name : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="dname" value="{{ctrl.dData.dname}}" readonly>
                            </div>
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Contact : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="dcontact" value="{{ctrl.dData.dcontact}}" readonly>
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Email : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="demail"  value="{{ctrl.dData.demail}}" readonly>
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Address : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="daddress" value="{{ctrl.dData.daddress}}" readonly>
                            </div>
						</div>
	
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Department : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="ddept" value="{{ctrl.dData.ddept}}" readonly>
                            </div>
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