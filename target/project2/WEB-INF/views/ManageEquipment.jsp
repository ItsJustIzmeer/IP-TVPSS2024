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
<link rel="stylesheet"
	href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Equipment List</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<div class="program-container">
						<div class="toolbar">
							<div class="toolbar-left">
								<h2>List of Equipment</h2>
							</div>
							<div class="toolbar-right">
								<a href="createReport" class="btn btn-success">Generate
									Report</a> <a href="addEquipment"
									class="btn btn-success-event">+ Add New Equipment</a>
							</div>
						</div>
						<div class="toolbar">
							<div class="toolbar-left">
								<!-- 							empty -->
							</div>
							<div class="toolbar-right">
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
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>No</th>
									<th>Equipment ID</th>
									<th>Equipment Name</th>
									<th>Brand</th>
									<th>Amount</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody id="tableBody">
								<tr>
									<td>1</td>
									<td>#666666</td>
									<td>Camera</td>
									<td>Canon</td>
									<td>3</td>
									<td><a href="detailEquipment"
										class="btn btn-primary details-btn">Details</a> <a
										href="editEquipment" class="btn btn-primary details-btn">Edit</a></td>
								</tr>
								<tr>
									<td>2</td>
									<td>#888888</td>
									<td>Phone</td>
									<td>iPhone</td>
									<td>4</td>
									<td><a href="detailEquipment"
										class="btn btn-primary details-btn">Details</a> <a
										href="editEquipment" class="btn btn-primary details-btn">Edit</a></td>
								</tr>
								<tr>
									<td>3</td>
									<td>#657921</td>
									<td>Camera</td>
									<td>Nikon</td>
									<td>2</td>
									<td><a href="detailEquipment"
										class="btn btn-primary details-btn">Details</a> <a
										href="editEquipment" class="btn btn-primary details-btn">Edit</a></td>
								</tr>
								<tr>
									<td>4</td>
									<td>#785923</td>
									<td>Camera</td>
									<td>FujiFilm</td>
									<td>4</td>
									<td><a href="detailEquipment"
										class="btn btn-primary details-btn">Details</a> <a
										href="editEquipment" class="btn btn-primary details-btn">Edit</a></td>
								</tr>
								<tr>
									<td>5</td>
									<td>#532556</td>
									<td>Camera</td>
									<td>Kodak</td>
									<td>6</td>
									<td><a href="detailEquipment"
										class="btn btn-primary details-btn">Details</a> <a
										href="editEquipment" class="btn btn-primary details-btn">Edit</a></td>
								</tr>
							</tbody>
							<!-- 							<tbody> -->
							<%-- 								<c:forEach items="${customers}" var="customer"> --%>
							<!-- 									<tr> -->
							<%-- 										<td>${no}</td> --%>
							<%-- 										<td>${id}</td> --%>
							<%-- 										<td>${name}</td> --%>
							<%-- 										<td>${brand}</td> --%>
							<%-- 										<td>${amount}</td> --%>
							<!-- 										<td><a -->
							<%-- 											href="<c:url value='#'/>" --%>
							<!-- 											class="btn btn-primary details-btn">Details</a> <a -->
							<!-- 									</tr> -->
							<%-- 								</c:forEach> --%>
							<!-- 							</tbody> -->
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
