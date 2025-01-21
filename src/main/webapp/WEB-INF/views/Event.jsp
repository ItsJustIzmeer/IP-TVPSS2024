<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Program & Event List</title>
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- Include navbar -->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- Include sidebar -->
		<jsp:include page="sidenav.jsp" />

		<!-- Main content -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Event</div>
			<c:if test="${read}">
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
							<!-- Search and Filter -->
							<div class="toolbar">
								<div class="toolbar-left">
									<input type="text" class="search-bar" placeholder="Search">
									<input type="date" class="date-picker">
									<button class="btn btn-secondary">Filter</button>
								</div>
								<div class="toolbar-right">
									<c:if test="${create}">
										<a
											href="<%=request.getContextPath() + '/'%>createEvent;jsessionid=<%=session.getId()%>"
											class="btn btn-success-event">+ Add New Event</a>
									</c:if>
								</div>
							</div>

							<!-- Program Table -->

							<table class="table table-striped">
								<thead>
									<tr>
										<th>Event Name</th>
										<th>Type</th>
										<th>Date</th>
										<th>Time</th>
										<th>Organizer</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty events}">
										<c:forEach var="event" items="${events}">
											<tr>
												<td>${event.name}</td>
												<td>${event.startDate}</td>
												<td>${event.endDate}</td>
												<td>${event.time}</td>
												<td>${event.organizer}</td>
												<td><c:if test="${update}">
														<a
															href="<%= request.getContextPath() + '/'%>detailEvent/${event.id}/edit;jsessionid=<%= session.getId() %>"
															class="details-btn">Edit</a>
													</c:if> 
													<c:choose>
													<c:when test="${loginUser.role == 'Student'}">
														<a
															href="<%= request.getContextPath() + '/'%>detailEvent/${event.id}/view;jsessionid=<%= session.getId() %>"
															class="details-btn">View</a>
													</c:when>
													<c:otherwise></c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty events}">
										<tr>
											<td colspan="6" style="text-align: center; color: red;">No
												events found.</td>
										</tr>
									</c:if>
								</tbody>
							</table>

							<!-- Pagination -->
							<div class="pagination">
								<button class="btn btn-light">&lt; Previous</button>
								<button class="btn btn-light">Next &gt;</button>
							</div>
						</div>
					</div>
					<!-- end of main content -->
				</div>
			</c:if>
		</div>
	</main>
</body>
</html>
