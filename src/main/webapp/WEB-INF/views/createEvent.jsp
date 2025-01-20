<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/systemStyle.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .form-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .form-category h3 {
            margin-bottom: 15px;
            font-size: 18px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, 
        .form-group textarea {
            padding: 8px;
            box-sizing: border-box;
        }
        .inline-group {
            display: flex;
            gap: 15px;
        }
        .radio-group {
            display: flex;
            gap: 15px;
        }
        .form-buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }
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
                <!-- Start of main content -->
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
                        <form id="createEventForm" method="post" action="<c:url value='/saveEvent'/>">
                            <!-- Event Details -->
                            <div class="form-category">
                                <h3>Event Details</h3>
                                <div class="form-group">
                                    <label for="name">Event Name</label>
                                    <input type="text" id="name" name="name" placeholder="Enter event name" required>
                                </div>
                                <div class="inline-group">
                                    <div class="form-group">
                                        <label for="startDate">Start Date</label>
                                        <input type="date" id="startDate" name="startDate" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate">End Date</label>
                                        <input type="date" id="endDate" name="endDate" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="time">Event Time</label>
                                    <input type="text" id="time" name="time" placeholder="e.g., 3:00 PM - 5:00 PM" required>
                                </div>
                                <div class="inline-group">
                                    <div class="form-group">
                                        <label for="organizer">Organizer</label>
                                        <input type="text" id="organizer" name="organizer" placeholder="Enter organizer name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="speaker">Speaker</label>
                                        <input type="text" id="speaker" name="speaker" placeholder="Enter speaker name">
                                    </div>
                                </div>
                            </div>

                            <!-- Contact Information -->
                            <div class="form-category">
                                <h3>Contact Information</h3>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" placeholder="Enter email address" required>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber">Phone Number</label>
                                    <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number">
                                </div>
                            </div>

                            <!-- Participant Details -->
                            <div class="form-category">
                                <h3>Participant Details</h3>
                                <div class="form-group">
                                    <label>Participant Limit</label>
                                    <div class="radio-group">
                                        <label>
                                            <input type="radio" name="participantType" value="limit" onclick=" $('#participantLimit').prop('disabled', false);" required> Limit
                                        </label>
                                        <input type="number" id="participantLimit" name="participantLimit" placeholder="Enter limit" style="width:50%" disabled>
                                        <label>
                                            <input type="radio" name="participantType" value="open" value="limit" onclick="$('#participantLimit').prop('disabled', true);" required> Open
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Event Type -->
                            <div class="form-category">
                                <h3>Event Type</h3>
                                <div class="form-group">
                                    <div class="radio-group">
                                        <label>
                                            <input type="radio" name="eventType" value="physical" required> Physical
                                        </label>
                                        <input type="text" id="eventLocation" name="eventLocation" placeholder="Enter location" disabled>
                                        <label>
                                            <input type="radio" name="eventType" value="virtual" required> Virtual
                                        </label>
                                        <input type="text" id="eventPlatform" name="eventPlatform" placeholder="Enter platform" disabled>
                                    </div>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="form-category">
                                <h3>Description</h3>
                                <div class="form-group">
                                    <textarea id="description" name="description" placeholder="Enter event description" required></textarea>
                                </div>
                            </div>

                            <!-- Form Buttons -->
                            <div class="form-buttons">
                                <button type="submit" class="btn btn-success">Save</button>
                                <a href="<%=request.getContextPath()%>/Event;jsessionid=<%=session.getId()%>" id="cancelbtn" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End of main content -->
            </div>
        </div>
    </main>

    <script>
        $(document).ready(function () {
            // Enable or disable participant limit
            $('input[name="participantType"]').change(function () {
                if ($(this).val() === 'limit') {
                    $('#participantLimit').prop('disabled', false);
                } else {
                    $('#participantLimit').prop('disabled', true);
                }
            });

            // Enable or disable location or platform
            $('input[name="eventType"]').change(function () {
                if ($(this).val() === 'physical') {
                    $('#eventLocation').prop('disabled', false);
                    $('#eventPlatform').prop('disabled', true);
                } else {
                    $('#eventLocation').prop('disabled', true);
                    $('#eventPlatform').prop('disabled', false);
                }
            });

            // Cancel confirmation
            $('#cancelbtn').click(function (event) {
                if (!confirm("Are you sure you want to cancel? Unsaved changes will be lost.")) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
