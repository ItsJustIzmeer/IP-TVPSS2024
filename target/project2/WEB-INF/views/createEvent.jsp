<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
<link rel="stylesheet"
	href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
</style>
</head>
<body>
	<!-- Include navbar -->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- Include sidebar -->
		<jsp:include page="sidenav.jsp" />

		<!-- Main content -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">Event / Create Event</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="box">
					<div class="form-container">
						<form id="createEventForm" method="post"
							action="<c:url value='/createEvent'/>">

							<!-- Event Details -->
							<div class="form-category">
								<h3>Event Details</h3>
								<div class="form-group">
									<label for="eventName">Name of Event</label> <input type="text"
										id="eventName" name="eventName" placeholder="Enter event name"
										required>
								</div>
								<div class="inline-group">
									<div class="form-group">
										<label for="startDate">Start Date</label> <input type="date"
											id="startDate" name="startDate" required>
									</div>
									<div class="form-group">
										<label for="endDate">End Date</label> <input type="date"
											id="endDate" name="endDate" required>
									</div>
								</div>
								<div class="form-group">
									<label for="eventTime">Time of Event</label> <input type="text"
										id="eventTime" name="eventTime"
										placeholder="e.g., 3:00pm - 5:00pm" required>
								</div>
								<div class="inline-group">
									<div class="form-group">
										<label for="organizer">Organizer</label> <input type="text"
											id="organizer" name="organizer"
											placeholder="Enter organizer name" required>
									</div>
									<div class="form-group">
										<label for="speaker">Speaker</label> <input type="text"
											id="speaker" name="speaker" placeholder="Enter speaker name"
											required>
									</div>
								</div>
							</div>

							<!-- Contact Information -->
							<div class="form-category">
								<h3>Contact Information</h3>
								<div class="form-group">
									<label for="email">Email</label> <input type="email" id="email"
										name="email" placeholder="Enter email address" required>
								</div>
								<div class="form-group">
									<label for="phoneNumber">Phone Number</label> <input type="tel"
										id="phoneNumber" name="phoneNumber"
										placeholder="Enter phone number" required>
								</div>
							</div>

							<!-- Participant Details -->
							<div class="form-category">
								<h3>Participant Details</h3>
								<div class="form-group">
									<label>Number of Participants</label>
									<div class="radio-group">
										<div class="radio-input">
											<input type="radio" id="limitParticipants"
												name="participants" value="limit" required> <label
												for="limitParticipants">Limit</label> <input type="number"
												id="participantLimit" name="participantLimit"
												placeholder="Enter limit" disabled>
										</div>
										<div class="radio-input">
											<input type="radio" id="openParticipants" name="participants"
												value="open" required> <label for="openParticipants">Open</label>
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
												value="physical" required> <label
												for="physicalEvent">Physical</label> <input type="text"
												id="eventLocation" name="eventLocation"
												placeholder="Enter event location" disabled>
										</div>
										<div class="radio-input">
											<input type="radio" id="virtualEvent" name="eventType"
												value="virtual" required> <label for="virtualEvent">Virtual</label>
											<input type="text" id="eventPlatform" name="eventPlatform"
												placeholder="Enter event platform" disabled>
										</div>
									</div>
								</div>
							</div>

							<!-- Description -->
							<div class="form-category">
								<h3>Description</h3>
								<div class="form-group">
									<textarea id="eventDescription" name="eventDescription"
										placeholder="Enter event description" required></textarea>
								</div>
							</div>

							<!-- Form Buttons -->
							<div class="form-buttons">
								<button onclick="submit();" class="btn btn-success">Save</button>
								<a href="Event" id="cancelbtn" class="btn btn-secondary">Cancel</a>
							</div>

						</form>
					</div>
				</div>
				<!-- end of main content -->
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

		$(document).ready(function() {
			// Enable or disable participant limit
			$('input[name="participants"]').change(function() {
				if ($(this).val() === 'limit') {
					$('#participantLimit').prop('disabled', false);
				} else {
					$('#participantLimit').prop('disabled', true);
				}
			});

			// Enable or disable event location/platform
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

		function submit() {
			$('#createEventForm').submit();
		}
	</script>
</body>
</html>
