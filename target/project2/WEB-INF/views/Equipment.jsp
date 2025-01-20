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
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Equipment</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<c:if test="${not empty error_msg}">
						<div class="error_msg"
							style="color: red; padding: 10px; border: 1px solid red; margin-bottom: 15px;">
							${error_msg}</div>
					</c:if>
					<c:if test="${not empty success_msg}">
						<div class="success_msg"
							style="color: green; padding: 10px; border: 1px solid green; margin-bottom: 15px;">
							${success_msg}</div>
					</c:if>
					<div class="program-container">
						<div class="toolbar">
							<div class="toolbar-left">
								<h2>List of Equipment</h2>
							</div>
							<div class="toolbar-right"></div>
						</div>
						<div class="toolbar">
							<div class="toolbar-left">
								<select class="filter-bar" id="filterDropdown">
									<option value="all">Show All</option>
									<option value="Camera">Camera</option>
									<option value="Phone">Phone</option>
									<option value="Green Screen">Green Screen</option>
									<option value="Laptop">Laptop</option>
									<option value="Lighting">Lighting</option>
									<option value="Background">Background</option>
								</select> <input type="text" class="search-bar" id="searchInput"
									placeholder="Search...">
							</div>
							<div class="toolbar-right">
								<c:if test="${create}">
									<a
										href="<%=request.getContextPath() + '/'%>createEquipment;jsessionid=<%=session.getId()%>"
										class="btn btn-success-event">+ Add New Equipment</a>
								</c:if>
							</div>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Equipment ID</th>
									<th>Equipment Name</th>
									<th>Brand</th>
									<th>Amount</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<c:if test="${not empty equipments}">
									<c:forEach var="equipment" items="${equipments}">
										<tr>
											<td>${equipment.equipmentID}</td>
											<td>${equipment.name}</td>
											<td>${equipment.brand}</td>
											<td>${equipment.amount}</td>
											<td><c:if test="${update}">
													<a
														href="<%= request.getContextPath() + '/'%>detailEquipment/${equipment.id}/edit;jsessionid=<%= session.getId() %>"
														class="details-btn">Edit</a>
												</c:if> <c:choose>
													<c:when test="${loginUser.role == 'student'}">
														<a
															href="<%= request.getContextPath() + '/'%>detailEquipment/${equipment.id}/view;jsessionid=<%= session.getId() %>"
															class="details-btn">View</a>
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty equipments}">
									<tr>
										<td colspan="6" style="text-align: center; color: red;">No
											equipments found.</td>
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
	<!-- 	<script> -->
	<script src="<c:url value='/resources/js/equipment.js'/>"></script>
	<!--   </script> -->
</body>
</html>
