<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TVPSS</title>
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
	<!-- Navbar -->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- Sidebar -->
		<jsp:include page="sidenav.jsp" />

		<!-- Main Content -->
		<div class="main-body">
			<div class="maintitle">User Management</div>
			<c:if test="${read}">
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
						<!-- Button Group -->
						<div class="btn_group">

							<button id="btnSearch" onclick="changeMode('searchmode');">Search</button>
							<c:if test="${create}">
								<button id="btnCreate" onclick="changeMode('createmode')">Create</button>
							</c:if>
							<c:if test="${update}">
								<button id="btnSave" onclick="validateForm();"
									style="display: none;">Save</button>
							</c:if>
							<c:if test="${delete}">
								<button id="btnDelete" onclick="deleteUser();"
									style="display: none;">Delete</button>
							</c:if>
							<button id="btnClear" onclick="changeMode('clear')">Clear</button>
						</div>
						<hr>
						<!-- Form -->
						<form id="formUser" class="formUser" method="post"
							action="<c:url value='/userMng/search'/>"
							enctype="application/x-www-form-urlencoded">
							<table width="100%">
								<tr>
									<td width="50%">
										<table>
											<tr>
												<td>Username</td>
												<td>:</td>
												<td><input type="text" name="username" id="username"
													value="${username != null ? username : ''}" /></td>
											</tr>
											<tr>
												<td>Email</td>
												<td>:</td>
												<td><input type="email" name="email" id="email"
													value="${email != null ? email : ''}" /></td>
											</tr>
											<tr id="password">
												<td>Password</td>
												<td>:</td>
												<td><input type="password" name="password"
													id="in_password" value="" /></td>
											</tr>
											<tr id="c_password">
												<td>Confirm Password</td>
												<td>:</td>
												<td><input type="password" name="c_password"
													id="in_c_password" value="" /></td>
											</tr>
											<tr>
												<td>Phone Number</td>
												<td>:</td>
												<td><input type="text" name="phoneNum" id="phoneNum"
													value="${phoneNum != null ? phoneNum : ''}" /></td>
											</tr>
											<tr>
												<td>Address</td>
												<td>:</td>
												<td><input type="text" name="address" id="address"
													value="${address != null ? address : ''}" /></td>
											</tr>
											<tr>
												<td>District</td>
												<td>:</td>
												<td><input type="text" name="district" id="district"
													value="${district != null ? district : ''}" /></td>
											</tr>
											<tr>
												<td>State</td>
												<td>:</td>
												<td><input type="text" name="state" id="state"
													value="${state != null ? state : ''}" /></td>
											</tr>
										</table>
									</td>
									<td width="50%" style="align-content: start">
										<div class="dropdowns">
											<table>
												<tr>
													<td><span>Status</span></td>
													<td>:</td>
													<td><select name="status" id="status">
															<option value="">All</option>
															<option value="A" ${status == 'A' ? 'selected' : ''}>Active</option>
															<option value="B" ${status == 'B' ? 'selected' : ''}>Banned</option>
													</select></td>
												</tr>
												<tr>
													<td><span>Role</span></td>
													<td>:</td>
													<td><select name="role" id="role">
															<option value="">All</option>
															<option value="student"
																${role == 'student' ? 'selected' : ''}>Student</option>
															<option value="school admin"
																${role == 'school admin' ? 'selected' : ''}>School
																Admin</option>
															<c:if
																test="${sessionScope.user.role == 'district officer'}">
																<option value="district officer"
																	${role == 'district officer' ? 'selected' : ''}>District</option>
															</c:if>
													</select></td>
												</tr>
												<tr>
													<td>School</td>
													<td>:</td>
													<td><select name="school" id="school">
															<c:choose>
																<c:when
																	test="${sessionScope.user.role == 'district officer'}">
																	<option value="">Select school</option>
																	<c:forEach var="schoolv" items="${schools}">
																		<option value="${schoolv.code}"
																			${school == schoolv.code ? 'selected' : ''}>${schoolv.name}</option>
																	</c:forEach>
																</c:when>
																<c:when
																	test="${sessionScope.user.role == 'school admin'}">
																	<option value="${sessionScope.user.school.code}"
																		selected>${sessionScope.user.school.name}</option>
																</c:when>
																<c:otherwise>
																	<option value="">Access not permitted.</option>
																</c:otherwise>
															</c:choose>
													</select></td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>


						</form>
					</div>
					<table class="gridTable">
						<thead>
							<tr>
								<td class="title">Action</td>
								<td class="title">Name</td>
								<td class="title">Email</td>
								<td class="title">School</td>
								<td class="title">Role</td>
								<td class="title">Status</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty userList}">
								<c:forEach var="user" items="${userList}">
									<tr id="row_${user.id}">
										<td><c:if test="${update}">
												<button class="edit_button" id="edit_button_${user.id }"
													onclick="editUser('${user.id}', '${user.username}', '${user.email}', '${user.status}', '${user.role}', '${user.phoneNum}', '${user.address}', '${user.district}', '${user.state}', '${user.school.code}')">
													<i class="fa fa-pencil"></i>
												</button>
											</c:if> <c:if test="${delete && sessionScope.user.id ne user.id}">
												<button class="delete_button" id="delete_${user.id}"
													onclick="deleteUser('${user.id}');">
													<i class="fa fa-trash"></i>
												</button>
											</c:if></td>
										<td>${user.username}</td>
										<td>${user.email}</td>
										<td>${user.school.name }</td>
										<td>${user.role}</td>
										<td><c:choose>
												<c:when test="${user.status == 'A'}">Active</c:when>
												<c:when test="${user.status == 'B'}">Banned</c:when>
												<c:when test="${user.status == 'D'}">Deleted</c:when>
												<c:otherwise>Unknown</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty userList}">
								<tr>
									<td colspan="5" style="text-align: center;"><span
										style="color: red">No users found.</span></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<p>Total users: ${userList.size()}</p>
				</div>
			</c:if>
		</div>
	</main>
	<script>
		var currMode = "firstLoad";

		// Function to change mode
		function changeMode(mode) {
			const btnSearch = document.getElementById('btnSearch');
			const btnCreate = document.getElementById('btnCreate');
			const btnSave = document.getElementById('btnSave');
			const btnDelete = document.getElementById('btnDelete');
			const formUser = document.getElementById('formUser');
			const pwd = document.getElementById('password');
			const c_pwd = document.getElementById('c_password');
			const statusSelect = document.getElementById('status');
			const roleSelect = document.getElementById('role');
			
			if (mode === 'searchmode') {
	            // Search mode settings
	            if (btnSearch) btnSearch.style.display = 'inline-block';
	            if (btnCreate) btnCreate.style.display = 'inline-block';
	            if (btnSave) btnSave.style.display = 'none';
	            if (btnDelete) btnDelete.style.display = 'none';
	            if (pwd) pwd.style.display = 'none';
	            if (c_pwd) c_pwd.style.display = 'none';
	            if( currMode != "firstLoad" && currMode != mode){
		            if (formUser) {
		                formUser.setAttribute('action', '<c:url value="/userMng/search"/>');
		                const inputs = formUser.querySelectorAll('input, select, textarea');
		                inputs.forEach(input => {
		                    input.value = '';  // Clear input values
		                    input.required = false;  // Remove required validation
		                });
		            }
	            }else if(currMode != "firstLoad" ){
	            	document.getElementById('formUser').submit();
	            }
	            if (statusSelect)statusSelect.disabled = false; 
	            if (roleSelect)roleSelect.disabled = false; 
	        } else if (mode === 'createmode') {
	            // Create mode settings
	            if (btnSearch) btnSearch.style.display = 'inline-block';
	            if (btnCreate) btnCreate.style.display = 'none';
	            if (btnSave) btnSave.style.display = 'inline-block';
	            if (btnDelete) btnDelete.style.display = 'none';
	            if (pwd) pwd.style.display = 'table-row';
	            if (c_pwd) c_pwd.style.display = 'table-row';
	            
	            if (formUser) {
	                formUser.setAttribute('action', '<c:url value="/userMng/create"/>');
	                const inputs = formUser.querySelectorAll('input, select, textarea');
	                inputs.forEach(input => {
	                    input.value = '';  // Clear input values
	                });
	            }
	            if (statusSelect){
	            	 statusSelect.disabled = false; 
	                 statusSelect.value = 'A';  
	                 // only status A is enabled
	                 for (let option of statusSelect.options) {
	                     if (option.value !== 'A') {
	                         option.disabled = true;
	                     }
	                 }
	            }
	            if (roleSelect)roleSelect.disabled = false; 
	        }else if(mode === 'updatemode'){
	        	 if (btnSearch) btnSearch.style.display = 'inline-block';
		            if (btnCreate) btnCreate.style.display = 'none';
		            if (btnSave) btnSave.style.display = 'inline-block';
		            if (btnDelete) btnDelete.style.display = 'inline-block';
		            if (pwd) pwd.style.display = 'table-row';
		            if (c_pwd) c_pwd.style.display = 'table-row';
		            
		            if (formUser) {
		                formUser.setAttribute('action', '<c:url value="/userMng/update"/>');
		                const inputs = formUser.querySelectorAll('input, select, textarea');
		                inputs.forEach(input => {
		                    input.value = '';  // Clear input values
		                });
		            }
		            if (statusSelect)statusSelect.disabled = false; 
		            if (roleSelect)roleSelect.disabled = true; 
	        }else if (mode === 'clear'){
	        	if(currMode == 'updatemode'){
	        		const userId = document.getElementById('userId');
	        		const editBtn = document.getElementById('edit_button_' + userId.value);  // Get the button with the correct ID

	        		if (editBtn) {
	        		    editBtn.click();  // Simulate the click event
	        		} else {
	        		    console.log("Edit button not found for user ID:", userId.value);
	        		}
	        	}else if (currMode == 'searchmode'){
		        	if (formUser) {
		                formUser.setAttribute('action', '<c:url value="/userMng/update"/>');
		                const inputs = formUser.querySelectorAll('input, select, textarea');
		                inputs.forEach(input => {
		                    input.value = '';  // Clear input values
		                });
		            }
	        	}else if (currMode == 'createmode'){
	        		if (formUser) {
		                formUser.setAttribute('action', '<c:url value="/userMng/create"/>');
		                const inputs = formUser.querySelectorAll('input, select, textarea');
		                inputs.forEach(input => {
		                    input.value = '';  // Clear input values
		                });
		            }
	        	}
	        	mode = currMode;
	        }
			currMode = mode;
		}
		
		function validateForm() {
	        var username = document.getElementById('username').value;
	        var email = document.getElementById('email').value;
	        var password = document.getElementById('in_password').value;
	        var cPassword = document.getElementById('in_c_password').value;
	        var status = document.getElementById('status').value;
	        var role = document.getElementById('role').value;
	        var phoneNum = document.getElementById('phoneNum').value;
	        var address = document.getElementById('address').value;
	        var district = document.getElementById('district').value;
	        var state = document.getElementById('state').value;
	        var school = document.getElementById('school').value;
	        var errorMessage = "";

	        // validation
	        if (username === "") {
	            errorMessage += "Username is required.\n";
	        }
	        if (email === "") {
	            errorMessage += "Email is required.\n";
	        } else if (!validateEmail(email)) {
	            errorMessage += "Invalid email format.\n";
	        }
	        if(currMode != 'updatemode'){
		        if (password === "") {
		            errorMessage += "Password is required.\n"+currMode;
		        } else if (password !== cPassword) {
		            errorMessage += "Passwords do not match.\n";
		        }
	        }
	        if (status === ""){
	        	errorMessage += "Status cannot be empty.\n";
	        }
	        if (role === ""){
	        	errorMessage += "Role cannot be empty.\n";
	        }
	        if (phoneNum === ""){
	        	errorMessage += "Phone Number cannot be empty.\n";
	        }
	        if (address === ""){
	        	errorMessage += "Address cannot be empty.\n";
	        }
	        if (district === ""){
	        	errorMessage += "District cannot be empty.\n";
	        }
	        if (state === ""){
	        	errorMessage += "State cannot be empty.\n";
	        }
	        if (school === ""){
	        	if(role != "district officer"){
	        	errorMessage += "School cannot be empty.\n";
	        	}
	        }

	        // If there's any validation error, alert the user and prevent form submission
	        if (errorMessage !== "") {
	            alert(errorMessage);
	            return false;
	        }else{
	        	document.getElementById('formUser').submit();
	        }
	    }
	
		
		function validateEmail(email) {
	        var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	        return re.test(email);
	    }

		function editUser(userId, username, email, status, role,phoneNum,address,district,state,school) {
			changeMode('updatemode');
		    // Populate the form fields with the user data
		    document.getElementById('username').value = username;
		    document.getElementById('email').value = email;
		    document.getElementById('status').value = status;
		    document.getElementById('role').value = role;
		    document.getElementById('phoneNum').value = phoneNum;
		    document.getElementById('address').value = address;
		    document.getElementById('district').value = district;
		    document.getElementById('state').value = state;
		    document.getElementById('school').value = school;

		    document.getElementById('in_password').value = ""; 
		    document.getElementById('in_c_password').value = ""; 

		    // Set a hidden field for the user ID (if necessary)
		    let userIdField = document.getElementById('userId');
		    if (!userIdField) {
		        // Create a hidden input field for userId if it doesn't exist
		        userIdField = document.createElement('input');
		        userIdField.type = 'hidden';
		        userIdField.name = 'id';
		        userIdField.id = 'userId';
		        document.getElementById('formUser').appendChild(userIdField);
		    }
		    userIdField.value = userId;
		}
		
		function deleteUser(userId=null){
			
			const confirmDelete = window.confirm("Are you sure you want to delete this user?");
		    if (!confirmDelete) {
		        return; 
		    }
		    
			const formUser = document.getElementById('formUser');
			if (formUser) formUser.setAttribute('action', '<c:url value="/userMng/delete"/>');
			let userIdField = document.getElementById('userId');
		    if (!userIdField) {
		        // Create a hidden input field for userId if it doesn't exist
		        userIdField = document.createElement('input');
		        userIdField.type = 'hidden';
		        userIdField.name = 'id';
		        userIdField.id = 'userId';
		        document.getElementById('formUser').appendChild(userIdField);
		        userIdField.value = userId;
		    }else{
		    	if(userId != null){
		    		//delete from girdTable
		    	userIdField.value = userId;
		    	}
		    }
			if (formUser) formUser.submit();
		}
		// Initialize when refresh/first load
		changeMode('searchmode');
	</script>
</body>
</html>
