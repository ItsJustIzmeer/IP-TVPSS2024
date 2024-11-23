<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Program & Event List</title>
<link rel="stylesheet" href="<c:url value='/resources/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/systemStyle.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/programLink.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
    <!-- Include navbar -->
    <jsp:include page="navbar.jsp" />
    <main>
        <!-- Include sidebar -->
        <jsp:include page="sidenav.jsp" />

        <!-- Main content -->
        <div class="main-body">
            <div class="program-container">
                <h1 class="title">Program & Event List</h1>

                <!-- Search and Filter -->
                <div class="toolbar">
                    <input type="text" class="search-bar" placeholder="Search">
                    <button class="btn btn-secondary">Filter</button>
                    <input type="date" class="date-picker">
                </div>

                <!-- Program Table -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Links</th>
                            <th>Title Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="http://localhost">http://localhost</a></td>
                            <td>Vlog Hari Kantin SMK Taman Universiti</td>
                            <td><button class="btn btn-primary details-btn" data-bs-toggle="modal" data-bs-target="#applyModal">Details</button></td>
                        </tr>
                        <tr>
                            <td><a href="http://localhost">http://localhost</a></td>
                            <td>Video Pertandingan Debat SMK Taman Universiti</td>
                            <td><button class="btn btn-primary details-btn" data-bs-toggle="modal" data-bs-target="#applyModal">Details</button></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="btn btn-light">&lt; Previous</button>
                    <button class="btn btn-light">Next &gt;</button>
                </div>
            </div>
        </div>

        <!-- Apply Modal -->
        <div class="modal fade" id="applyModal" tabindex="-1" aria-labelledby="applyModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="applyModalLabel">Apply to Become Crew</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="applyForm">
                            <div class="mb-3">
                                <label for="programName" class="form-label">Program Name</label>
                                <input type="text" class="form-control" id="programName" value="Vlog Hari Kantin SMK Taman Universiti" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" placeholder="Enter your full name">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter your email">
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="3" placeholder="Why do you want to join?"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success">Submit Application</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
