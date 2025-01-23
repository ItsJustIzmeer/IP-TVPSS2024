<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- Include navbar -->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- Include sidebar -->
		<jsp:include page="sidenav.jsp" />

		<!-- Main content -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Equipment / Create Equipment</div>
			<div class="main-container">
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
					<div class="form-container">
						<form id="createEquipmentForm" method="post"
							action="<c:url value='/saveEquipment'/>">
<%-- 							<input type="hidden" name="id" value="${equipment.id}"> --%>

							<!-- Event Details -->
							<div class="form-category">
								<h3>Add New Equipment</h3>
								<div class="form-group">
									<label for="equipmentID">Equipment ID</label> <input
										type="text" id="equipmentID" name="equipmentID" value=""
										required>
								</div>
								<div class="inline-group">
									<div class="form-group">
										<label for="equipmentName">Equipment Name</label> <input
											type="text" id="equipmentName" name="equipmentName"
											value="" required>
									</div>
									<div class="form-group">
										<label for="equipmentAmount">Equipment Amount</label> <input
											type="number" id="equipmentAmount" name="equipmentAmount"
											value="" required>
									</div>
								</div>
								<div class="form-group">
									<label for="equipmentBrand">Equipment Brand</label> <input
										type="text" id="equipmentBrand" name="equipmentBrand"
										value="" required>
								</div>
							</div>
							<!-- Form Buttons -->
							<div class="form-buttons">
								<button type="submit" class="btn btn-success">Save</button>
								<a
									href="<%=request.getContextPath()%>/Equipment;jsessionid=<%=session.getId()%>"
									id="cancelbtn" class="btn btn-secondary">Cancel</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
		$(document).ready(
				// Cancel confirmation
	            $('#cancelbtn').click(function (event) {
	                if (!confirm("Are you sure you want to cancel? Unsaved changes will be lost.")) {
	                    event.preventDefault();
	                }
	            }));

		function submit() {
			$('#createEquipmentForm').submit();
		}
	</script>
</body>
</html>
