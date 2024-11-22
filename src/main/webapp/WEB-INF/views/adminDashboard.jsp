<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TVPSS Admin</title>
<link rel="stylesheet" href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/systemStyle.css'/>">
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
	<!-- side menu page -->
	<jsp:include page="sidenav.jsp" />

	<!-- main body -->
	<div class="main-body" style="width: -webkit-fill-available;">
		<div class="maintitle">PSS Dashboard</div>
		<div class="main-container">
			<!-- start of main content -->
			<div class="box"></div>
			<!--  end of main content -->
		</div>
	</div>
	</main>
</body>
</html>