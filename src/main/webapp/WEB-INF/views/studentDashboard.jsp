<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
<link rel="stylesheet" href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/studentview.css'/>">
</head>
<body>
    <!-- Include navbar -->
    <jsp:include page="navbar.jsp" />
    <main>
        <!-- Include sidebar -->
        <jsp:include page="sidenav.jsp" />

        <!-- Main content -->
        <div class="main-body">
            <div class="dashboard-container">
                <!-- Title -->
                <h1 class="dashboard-title">Student Dashboard</h1>

                <!-- Activity and Program Row -->
                <div class="row">
                    <!-- Your Activity Section -->
                    <div class="card activity-section">
                        <h2>Your Activity</h2>
                        <ul class="activity-list">
                            <li><span>Here</span><span class="count">4</span></li>
                            <li><span>Future</span><span class="count">3</span></li>
                            <li><span>Draft</span><span class="count">2</span></li>
                            <li><span>Tasks</span><span class="count">2</span></li>
                        </ul>
                        <a href="#" class="view-details">View Details</a>
                    </div>

                    <!-- Program Section -->
                    <div class="card program-section">
                        <h2>Program</h2>
                        <ul class="program-list">
                            <li><span>Telegram Bot</span><div class="progress"><div class="progress-bar" style="width: 70%;"></div></div><span>7</span></li>
                            <li><span>Google Cloud</span><div class="progress"><div class="progress-bar" style="width: 20%;"></div></div><span>2</span></li>
                            <li><span>Workshop Intro</span><div class="progress"><div class="progress-bar" style="width: 60%;"></div></div><span>6</span></li>
                            <li><span>Timeline</span><div class="progress"><div class="progress-bar" style="width: 50%;"></div></div><span>5</span></li>
                            <li><span>Sharing</span><div class="progress"><div class="progress-bar" style="width: 30%;"></div></div><span>3</span></li>
                        </ul>
                    </div>
                </div>

                <!-- Announcements Section -->
                <div class="announcement-section">
                    <div class="card">
                        <div class="announcement">
                            <h3>The new program has been announced!</h3>
                            <p>Meetup: System Tools</p>
                            <button class="view-btn">View</button>
                        </div>
                        <div class="announcement">
                            <h3>Tips to get familiar with the website</h3>
                            <p>Meetup: System Tools</p>
                            <button class="view-btn">View</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
