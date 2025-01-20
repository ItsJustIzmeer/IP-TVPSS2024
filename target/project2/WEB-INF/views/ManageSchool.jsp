<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.currPage.title}</title>
<link rel="icon" type="image/x-icon"
	href="<c:url value='/resources/img/favicon.ico'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<script></script>
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Manage School</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">

					<div class="program-container">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Code</th>
									<th>School Name</th>
									<th>Version</th>
									<th>Headmaster</th>
									<th>Address</th>
									<th>District</th>
									<th>State</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty schools}">
									<c:forEach var="school" items="${schools}">
										<tr>
											<td>${school.code}</td>
											<td>${school.name}</td>
											<td>${school.version}</td>
											<td>${school.head}</td>
											<td>${school.address}</td>
											<td>${school.district}</td>
											<td>${school.state}</td>
											<td><a href="detailEvent/${school.id}"
												class="details-btn">Edit</a></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty schools}">
									<tr>
										<td colspan="6" style="text-align: center; color: red;">No
											schools found.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>

				</div>
				<!--  end of main content -->
			</div>
		</div>
	</main>
</body>
</html>