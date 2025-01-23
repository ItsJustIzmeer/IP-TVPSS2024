<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Event Applications</title>
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
</head>
<style>
main {
	display: flex;
	min-height: 100vh;
}

.main-body {
	flex-grow: 1;
	padding: 20px;
	background-color: var(--secondary);
}

.maintitle {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.main-container {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.box {
	background-color: var(--primary);
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.btn_group {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
}

.btn_group button {
	padding: 6px 11px;
	border: none;
	background-color: #5050b5;
	cursor: pointer;
	border-radius: 5px;
	color: white;
}

.btn_group button:hover {
	background-color: #6a86b5;
}

hr {
	border: none;
	border-top: 1px solid var(--shades);
	margin: 20px 0;
}

.gridTable {
	width: 100%;
	border-collapse: collapse;
	background: white;
	box-shadow: 4px 4px 4px #eeeeee;
	border-radius: 5px;
}

.gridTable td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid var(--shades);
}

.gridTable .title {
	font-weight: bold;
	background-color: var(--shades);
}

.edit_button, .delete_button {
	background: none;
	border: none;
	cursor: pointer;
	font-size: 18px;
	margin-right: 5px;
}

.edit_button i {
	color: #4CAF50;
}

.delete_button i {
	color: #F44336;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.btn_group {
		flex-wrap: wrap;
	}
	.formGPT table {
		width: 100%;
	}
	.formGPT input {
		width: 100%;
	}
}
</style>
<body>
	<!-- nav bar page -->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Manage Event Applications</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<h2>Event Applications</h2>
					<table class="gridTable">
						<thead>
							<tr>
								<th class="title">#</th>
								<th class="title">Student Name</th>
								<th class="title">Event Name</th>
								<th class="title">Preferred Role</th>
								<th class="title">Status</th>
								<th class="title">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="application" items="${applicationList}"
								varStatus="status">
								<tr>
									<td>${status.index + 1}</td>
									<td>${application.studentName}</td>
									<td>${application.eventName}</td>
									<td>${application.role}</td>
									<td>${application.status}</td>
									<td><c:if test="${application.status == 'pending'}">
											<form method="post"
												action="<c:url value='/approveEventApplication'/>"
												style="display: inline;">
												<input type="hidden" name="applicationId"
													value="${application.id}" />
												<button type="submit" class="btn btn-success">Approve</button>
											</form>
											<form  method="post"
												action="<c:url value='/rejectEventApplication'/>"
												style="display: inline;">
												<input type="hidden" name="applicationId"
													value="${application.id}" />
												<button type="submit" class="btn btn-danger">Reject</button>
											</form>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- end of main content -->
			</div>
		</div>
	</main>
</body>
</html>