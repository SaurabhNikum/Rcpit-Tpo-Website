<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="connectDB.*"%>
<%@page import="services.*"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="org.slf4j.Logger"%>
<%! final private static Logger log = LoggerFactory.getLogger("viewSelectionProcess1_JSP"); %>
<%
	if (!Auth.getRole(session).equals("STUDENT")) {
		response.sendRedirect("studentLogin.jsp");
		return;
	}
%>
<%
	String fileName = "assets/img/find_user.png";
	try {
		Statement statement = null;
		ResultSet rs = null;
		Connection conn = DBconnect.getConnect();
		statement = conn.createStatement();
		String sql = "select image from student where roll_no = '" + session.getAttribute("ROLL_NO") + "'";
		rs = statement.executeQuery(sql);
		if (rs.next()) {
			fileName = rs.getString("IMAGE");
		}
	} catch (Exception e) {
		log.error("Could not load page : {}", e);
	}
	if (!fileName.equalsIgnoreCase("assets/img/find_user.png"))
		fileName = "/Download?file=" + fileName + "&type=image/jpeg";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>RCPIT, TPO</title>
<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script type="text/javascript">
   	function access(){
		<% Object s1 = session.getAttribute("msg");
		 if(s1!=null){ %>
		alert('<%=s1.toString()%>');
		<% session.setAttribute("msg",null);
		}	%>
	}
</script>
</head>
<body onload="access()">
	<%
		//AbstractDao abstractDao=new AbstractDao();
	%>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="font-size: 19px" href="#"><%= session.getAttribute("name") %></a>
			</div>
			<div
				style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
				&nbsp; <a href="/Logout"
					class="btn btn-danger square-btn-adjust">Logout</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center"><img src="<%=fileName%>"
						class="user-image img-responsive" style="height: 100px;" /></li>
			<li><a href="uploadResume.jsp"><i class="fa fa-edit fa-3x"></i>Upload/Update
					Resume</a></li>
			<li><a href="uploadPic.jsp"><i class="fa fa-edit fa-3x"></i>Upload/Update
					Passport Photo</a></li>
			<li><a href="viewDrives.jsp"><i class="fa fa-edit fa-3x"></i>View
					Upcoming Campus Drives Details</a></li>
			<li><a href="viewSelectionProcess.jsp"><i
					class="fa fa-edit fa-3x"></i>View selection Process Of Company</a></li>
			<li><a href="learnAptituteQuestions.jsp"><i
					class="fa fa-edit fa-3x"></i>Learn Aptitute Questions</a></li>
			<li><a
				href="https://mail.google.com/mail/u/0/#search/from%3Amilkesh.jain31%40gmail.com"><i
					class="fa fa-edit fa-3x"></i>View Notifications</a></li>
			<li><a href="askQueries.jsp"><i class="fa fa-edit fa-3x"></i>Ask
					Queries</a></li>
			<li><a href="addFeedback.jsp"><i class="fa fa-edit fa-3x"></i>Add
					Feedback For Students</a></li>
			<li><a href="viewAnsweredQueries.jsp"><i
					class="fa fa-edit fa-3x"></i>View Answered Queries By TPO</a></li>
			<li><a href="password.jsp"><i
					class="fa fa-edit fa-3x"></i>Change Password</a></li>

				</ul>

			</div>

		</nav>
		<!-- /. NAV SIDE  -->

		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<h2>&nbsp&nbspView Company Details</h2>
					<div class="col-md-12">

						<table border="1" id="displaytable" class="table table-bordered"
							style="">
							<thead>
								<tr>
									<th>Name</th>
									<th>Information</th>
									<th>Email</th>
									<th>Drive Date</th>
									<th>Drive Location</th>
									<th>Package</th>
									<th>DEGREE</th>
									<th>HSC / DIPLOMA</th>
									<th>SSC</th>
									<th>ACTIVE_BACKLOG</th>	
									<th>ELIGIBLE_BRANCH</th>									
									<th>GAP</th>																		
									<th>Test Rounds</th>
									<th>Requirement</th>
									<th>Address</th>
									<th>Contact No.</th>


								</tr>
								<%
									Statement statement = null;
									ResultSet resultSet = null;
								%>
								<%
									try {
										Connection conn = DBconnect.getConnect();
										statement = conn.createStatement();
										String sql = "select * from company where NAME='" + UserInfo.getCname() + "'";
										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
								%>
							
							<tbody>
								<tr>
									<td><%=resultSet.getString("NAME")%></td>
									<td><%=resultSet.getString("INFORMATION")%></td>
									<td><%=resultSet.getString("EMAIL_ID")%></td>
									<td><%=resultSet.getString("DRIVE_DATE")%></td>
									<td><%=resultSet.getString("DRIVE_LOCATION")%></td>

									<td><%=resultSet.getString("PACKAGE")%></td>
									<td><%=resultSet.getString("DEGREE")%></td>
									<td><%=resultSet.getString("HSC_DIPLOMA")%></td>
									<td><%=resultSet.getString("SSC")%></td>	
									<td><%=resultSet.getString("ACTIVE_BACKLOG")%></td>	
									<td><%=resultSet.getString("ELIGIBLE_BRANCH")%></td>									
									<td><%=resultSet.getString("GAP")%></td>																										
									<td><%=resultSet.getString("SELECTION_PROCESS")%></td>
									<td><%=resultSet.getString("REQUIREMENT")%></td>
									<td><%=resultSet.getString("ADDRESS")%></td>
									<td><%=resultSet.getString("CONTACT_NUMBER")%></td>


								</tr>
							</tbody>
							<%
								}
									//connection.close();
								} catch (Exception e) {
									log.error("Could not view selection process : {}", e);
								}
							%>

							</thead>
						</table>
					</div>
				</div>

			</div>

		</div>
	</div>

	</div>

	<div
		style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">
		&nbsp; <a href="menuForStudent.jsp"
			class="btn btn-danger square-btn-adjust">Back To Home Page</a>
	</div>

	<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
	<SCRIPT language=Javascript>
		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;

			if (charCode > 31 && (charCode<48 || charCode>57))
				return false;

			return true;
		}
	</SCRIPT>

</body>
</html>
