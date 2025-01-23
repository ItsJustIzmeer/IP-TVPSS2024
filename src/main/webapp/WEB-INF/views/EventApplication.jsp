<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Application</title>
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
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
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Event Application</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<div class="form-container">
						<h2>Apply to Join Event as a Crew</h2>
						<form action="<c:url value='/submitEventApplication'/>"  class="formUser" method="post">

							<div class="form-group">
								<label for="studentName">Name:</label> <input type="text"
									id="studentName" name="studentName" class="form-control" value="${user.name}"
									required />
									<input type="hidden" name="studentId" value="${user.id}"/>
							</div>

							<div class="form-group">
								<label for="email">Email:</label> <input type="email" id="email"
									name="email" class="form-control" value="${user.email}" required />
							</div>

							<div class="form-group">
								<label for="contactNumber">Contact Number:</label> <input
									type="text" id="contactNumber" name="contactNumber"
									class="form-control" value="${user.phoneNumber}" required />
							</div>

							<div class="form-group">
								<label for="event">Event:</label>
								<input type="text" id="eventName" name="eventName" value="${event.name}" readonly/>
								<input type="hidden" id="eventId" name="eventId" value="${event.id}"/>
							</div>

							<div class="form-group">
								<label for="role">Preferred Role:</label> 
								<select name="role" id="role">
								<option value="">Select a Role</option>
								<option value="photographer">Photographer</option>
								<option value="director">Director</option>
								<option value="interviewer">Interviewer</option>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Submit
								Application</button>
						</form>
					</div>
				</div>
				<!--  end of main content -->
			</div>
		</div>
	</main>
</body>
</html>