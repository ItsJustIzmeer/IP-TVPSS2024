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
			<div class="maintitle">Upgrade Level</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<div class="program-container">
						<form>
							<div class="form-category">
								<div class="inline-group">
									<div class="form-group">
										<label for="schoolLevel">Latest School Level</label> <select
											name="schoolLevel" id="cars">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
									<div class="form-group"></div>
								</div>
								<div class="form-group">
									<label for="upgradeLevelComment">Comment</label>
									<textarea id="upgradeLevelComment" name="upgradeLevelComment"
										required></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!--  end of main content -->
			</div>
		</div>
	</main>
</body>
</html>