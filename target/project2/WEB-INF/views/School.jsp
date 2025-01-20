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
			<div class="maintitle">School Information</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<div class="program-container">
						<div class="form-container">
							<div class="image-container">
								<img src="<c:url value='/resources/img/smktu.png'/>"
									alt="School Logo" class="image-logo"> <img
									src="<c:url value=''/>" alt="TVPSS Logo" class="image-logo">
							</div>
							<form id="editScoolForm" method="post"
								action="<c:url value='/editSchool'/>">
								<input type="hidden" name="id" value="${event.id}">

								<!-- School Details -->
								<div class="form-category">
									<div class="inline-group">
										<div class="form-group">
											<label for="schoolName">School Name</label> <input
												type="text" id="schoolName" name="schoolName"
												value="${school.name}" required disabled>
										</div>
										<div class="form-group">
											<label for="schoolCode">School Code</label> <input
												type="text" id="schoolCode" name="schoolCode"
												value="${school.code}" required disabled>
										</div>
									</div>
									<div class="inline-group">
										<div class="form-group">
											<label for="schoolType">School type</label> <input
												type="text" id="schoolType" name="schoolType"
												value="${school.type}" required disabled>
										</div>
										<div class="form-group">
											<label for="schoolVersion">School Version</label> <input
												type="text" id="schoolVersion" name="schoolVersion"
												value="${school.version}" required disabled>
										</div>
									</div>
									<div class="inline-group">
										<div class="form-group">
											<label for="schoolTotalStudent">Total Students</label> <input
												type="text" id="schoolTotalStudent"
												name="schoolTotalStudent" value="${school.totalStudent}"
												required>
										</div>
										<div class="form-group">
											<label for="schoolTotalTeacher">Total Teachers</label> <input
												type="text" id="schoolTotalTeacher"
												name="schoolTotalTeacher" value="${school.totalTeacher}"
												required>
										</div>
									</div>
									<div class="form-group">
										<label for="schoolHead">Headmaster Name</label> <input
											type="text" id="schoolHead" name="schoolHead"
											value="${school.head}" required>
									</div>

									<div class="form-group">
										<label for="schoolPhoneNum">Phone Number</label> <input
											type="number" id="schoolPhoneNum" name="schoolPhoneNum"
											value="${school.name}" required>
									</div>
									<div class="form-group">

										<label for="schoolAddress">Address</label>
										<textarea id="schoolAddress" name="schoolAddress" required>${school.address}</textarea>
									</div>
									<div class="inline-group">
										<div class="form-group">
											<label for="schoolDistrict">District</label> <input
												type="text" id="schoolDistrict" name="schoolDistrict"
												value="${school.district}" required>
										</div>
										<div class="form-group">
											<label for="schoolState">State</label> <input type="text"
												id="schoolState" name="schoolState" value="${school.state}"
												required>
										</div>
									</div>
									<div class="form-buttons">
										<button type="submit" class="btn btn-success">Update</button>
										<a href="<%=request.getContextPath()%>/Event" id="cancelbtn"
											class="btn btn-secondary">Cancel</a>
									</div>
								</div>
							</form>
						</div>
						<div class="program-container"></div>
					</div>
				</div>
				<!--  end of main content -->
			</div>
		</div>
	</main>
</body>
</html>