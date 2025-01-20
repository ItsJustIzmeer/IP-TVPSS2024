<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment Details</title>
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
			<div class="maintitle">Equipment / Equipment Details</div>
			<div class="main-container">
				<div class="box">
					<div class="form-container">
						<form id="editEquipmentForm" method="post"
							action="<c:url value='/editEquipment'/>">
							<input type="hidden" name="id" value="${equipment.id}">

							<!-- Equipment Details -->
							<div class="form-category">
								<h3>Equipment Details</h3>
								<div class="form-group">
									<label for="equipmentID">Equipment ID</label>
									<c:if test="${action}">
										<input type="text" id="equipmentID" name="equipmentID"
											value="${equipment.equipmentID}" required>
									</c:if>
									<c:if test="${not action}">
										<label>${equipment.equipmentID}</label>
									</c:if>
								</div>
								<div class="inline-group">
									<div class="form-group">
										<label for="equipmentName">Equipment Name</label> <input
											type="text" id="equipmentName" name="equipmentName"
											value="${equipment.name}" required>
									</div>
									<div class="form-group">
										<label for="equipmentAmount">Equipment Amount</label>
										<c:if test="${action}">
											<input type="number" id="equipmentAmount"
												name="equipmentAmount" value="${equipment.amount}" required>
										</c:if>
										<c:if test="${not action}">
											<label>${equipment.amount}</label>
										</c:if>
									</div>
								</div>
								<div class="form-group">
									<label for="equipmentBrand">Equipment Brand</label>
									<c:if test="${action}">
										<input type="text" id="equipmentBrand" name="equipmentBrand"
											value="${equipment.brand}" required>
									</c:if>
									<c:if test="${not action}">
										<label>${equipment.brand}</label>
									</c:if>
								</div>
							</div>

							<!-- Form Buttons -->
							<div class="form-buttons">
								<c:if test="${update}">
									<button type="submit" class="btn btn-success">Update</button>
								</c:if>
								<c:if test="${delete}">
									<button type="button" class="btn btn-danger"
										onclick="confirmDelete('${equipment.id}')">Delete</button>
								</c:if>
								<a
									href="<%=request.getContextPath() + '/'%>Equipment;jsessionid=<%=session.getId()%>"
									id="cancelbtn" class="btn btn-secondary">Cancel</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script>
		document
				.querySelector('#cancelbtn')
				.addEventListener(
						'click',
						function(event) {
							if (!confirm("Are you sure you want to cancel? Unsaved changes will be lost.")) {
								event.preventDefault(); // Prevents navigation if user cancels
							}
						});

		$(document).ready(
				function() {
					$('input[name="participants"]').change(
							function() {
								$('#participantLimit').prop('disabled',
										$(this).val() !== 'limit');
							});

					$('input[name="eventType"]').change(function() {
						if ($(this).val() === 'physical') {
							$('#eventLocation').prop('disabled', false);
							$('#eventPlatform').prop('disabled', true);
						} else {
							$('#eventLocation').prop('disabled', true);
							$('#eventPlatform').prop('disabled', false);
						}
					});
				});

		function confirmDelete(equipmentId) {
			const confirmDelete = window
					.confirm("Are you sure you want to delete this equipment?");
			if (!confirmDelete) {
				return;
			}

			const hiddenForm = document.createElement('form');
			hiddenForm.setAttribute('action', '<c:url value="/deleteEquipment"/>');
			hiddenForm.setAttribute('method', 'post');

			const inputField = document.createElement('input');
			inputField.name = "id";
			inputField.value = equipmentID;
			hiddenForm.appendChild(inputField);

			document.body.appendChild(hiddenForm);
			hiddenForm.submit();
		}
	</script>
</body>
</html>
