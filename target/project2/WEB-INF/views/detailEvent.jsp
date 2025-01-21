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
			<div class="maintitle">Event / Event Details</div>
			<c:if test="${read}">
				<div class="main-container">
					<div class="box">
						<div class="form-container">
							<form id="editEventForm" method="post"
								action="<c:url value='/editEvent'/>">
								<input type="hidden" name="id" value="${event.id}">

								<!-- Event Details -->
								<div class="form-category">
									<h3>Event Details</h3>
									<div class="form-group">
										<label for="name">Name of Event</label>
										<c:if test="${action}">
											<input type="text" id="name" name="name"
												value="${event.name}" required>
										</c:if>
										<c:if test="${not action}">
											<label>${event.name}</label>
										</c:if>

									</div>
									<div class="inline-group">
										<div class="form-group">
											<label for="startDate">Start Date</label>
											<c:if test="${action}">
												<input type="date" id="startDate" name="startDate"
													value="${startDate}" required>
											</c:if>
											<c:if test="${not action}">
												<label>${startDate}</label>
											</c:if>
										</div>
										<div class="form-group">
											<label for="endDate">End Date</label>
											<c:if test="${action}">
												<input type="date" id="endDate" name="endDate"
													value="${endDate}" required>
											</c:if>
											<c:if test="${not action}">
												<label>${endDate}</label>
											</c:if>
										</div>
									</div>
									<div class="form-group">
										<label for="time">Time of Event</label>
										<c:if test="${action}">
											<input type="text" id="time" name="time"
												value="${event.time}" required>
										</c:if>
										<c:if test="${not action}">
											<label>${event.time }</label>
										</c:if>
									</div>
									<div class="inline-group">
										<div class="form-group">
											<label for="organizer">Organizer</label>
											<c:if test="${action}">
												<input type="text" id="organizer" name="organizer"
													value="${event.organizer}" required>
											</c:if>
											<c:if test="${not action}">
												<label>${event.organizer }</label>
											</c:if>
										</div>
										<div class="form-group">
											<label for="speaker">Speaker</label>
											<c:if test="${action}">
												<input type="text" id="speaker" name="speaker"
													value="${event.speaker}" required>
											</c:if>
											<c:if test="${not action}">
												<label>${event.speaker }</label>
											</c:if>
										</div>
									</div>
								</div>

								<!-- Contact Information -->
								<div class="form-category">
									<h3>Contact Information</h3>
									<div class="form-group">
										<label for="email">Email</label>
										<c:if test="${action}">
											<input type="email" id="email" name="email"
												value="${event.email}" required>
										</c:if>
										<c:if test="${not action}">
											<label>${event.email }</label>
										</c:if>
									</div>
									<div class="form-group">
										<label for="phoneNumber">Phone Number</label>
										<c:if test="${action}">
											<input type="tel" id="phoneNumber" name="phoneNumber"
												value="${event.phoneNumber}" required>
										</c:if>
										<c:if test="${not action}">
											<label>${event.phoneNumber }</label>
										</c:if>
									</div>
								</div>

								<!-- Participant Details -->
								<c:if test="${action}">
									<div class="form-category">
										<h3>Participant Details</h3>
										<div class="form-group">
											<label>Number of Participants</label>
											<div class="radio-group">
												<div class="radio-input">
													<input type="radio" id="limitParticipants"
														name="participants" value="limit"
														${event.participantType == 'limit' ? 'checked' : ''}>
													<label for="limitParticipants">Limit</label> <input
														type="number" id="participantLimit"
														name="participantLimit" value="${event.participantLimit}"
														${event.participantType == 'limit' ? '' : 'disabled'}>
												</div>
												<div class="radio-input">
													<input type="radio" id="openParticipants"
														name="participants" value="open"
														${event.participantType == 'open' ? 'checked' : ''}>
													<label for="openParticipants">Open</label>
												</div>
											</div>
										</div>
									</div>

									<!-- Event Type -->
									<div class="form-category">
										<h3>Event Type</h3>
										<div class="form-group">
											<div class="radio-group">
												<div class="radio-input">
													<input type="radio" id="physicalEvent" name="eventType"
														value="physical"
														${event.eventType == 'physical' ? 'checked' : ''}>
													<label for="physicalEvent">Physical</label> <input
														type="text" id="eventLocation" name="eventLocation"
														value="${event.eventLocation}"
														${event.eventType == 'physical' ? '' : 'disabled'}>
												</div>
												<div class="radio-input">
													<input type="radio" id="virtualEvent" name="eventType"
														value="virtual"
														${event.eventType == 'virtual' ? 'checked' : ''}>
													<label for="virtualEvent">Virtual</label> <input
														type="text" id="eventPlatform" name="eventPlatform"
														value="${event.eventPlatform}"
														${event.eventType == 'virtual' ? '' : 'disabled'}>
												</div>
											</div>
										</div>
									</div>
								</c:if>
								<!-- Description -->
								<div class="form-category">
									<h3>Description</h3>
									<div class="form-group">
										<c:if test="${action}">
											<textarea id="eventDescription" name="eventDescription"
												required>${event.description}</textarea>
										</c:if>
										<c:if test="${not action}">
											<label>${event.description }</label>
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
											onclick="confirmDelete('${event.id}')">Delete</button>
									</c:if>
									<c:choose>
										<c:when test="${loginUser.role == 'Student'}">
											<a
												href="<%=request.getContextPath() + '/'%>EventApplication/${event.id};jsessionid=<%=session.getId()%>"
												id="cancelbtn" class="btn btn-secondary">Join Event</a>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
									<a
										href="<%=request.getContextPath() + '/'%>Event;jsessionid=<%=session.getId()%>"
										id="cancelbtn" class="btn btn-secondary">Cancel</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</main>
	<script>
		$(document).ready(
				function() {
					// jQuery code to handle change events
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

				}

		);

		function confirmDelete(eventId) {
			const confirmDelete = window
					.confirm("Are you sure you want to delete this event?");
			if (!confirmDelete) {
				return;
			}

			const hiddenForm = document.createElement('form');
			hiddenForm.setAttribute('action', '<c:url value="/deleteEvent"/>');
			hiddenForm.setAttribute('method', 'post');

			const inputField = document.createElement('input');
			inputField.name = "id";
			inputField.value = eventId;
			hiddenForm.appendChild(inputField);

			document.body.appendChild(hiddenForm);
			hiddenForm.submit();
		}
	</script>
</body>
</html>
