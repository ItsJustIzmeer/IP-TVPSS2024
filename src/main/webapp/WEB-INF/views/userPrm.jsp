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
<title>TVPSS Admin</title>
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
			<div class="maintitle">Permission Management</div>
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
							<button id="btnSearch"
								onclick="document.getElementById('formUser').submit();">Search</button>
							<c:if test="${update && not empty tableRows}">
								<button id="btnSave" onclick="validateForm();">Save</button>
							</c:if>
							<button id="btnClear" >Clear</button>
							<button id="btnReset" style="display: none;">Reset</button>
						</div>
						<hr>
						<!-- Form -->
						<form class="formUser" id="formUser" method="post"
							action="<c:url value='/userPrm/search'/>">
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
							</table>
							<c:if test="${not empty userId}">
								<input type="hidden" name="id" id="userId" value="${userId}">
							</c:if>
						</form>
					</div>
					<!-- Table -->
					<table class="gridTable" id="hdTable">
						<thead>
							<tr>
								<td class="title">Action</td>
								<td class="title">Name</td>
								<td class="title">Email</td>
								<td class="title">Role</td>
								<td class="title">Status</td>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty userList}">
								<c:forEach var="user" items="${userList}">
									<tr id="row_${user.id}">
										<td><c:if test="${update}">
												<button class="edit_button"
													onclick="editUser('${user.id}');">
													<i class="fa fa-pencil"></i>
												</button>
											</c:if>
										<td>${user.username}</td>
										<td>${user.email}</td>
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

					<c:if test="${not empty tableRows}">
						<form id="formPrm" class="formPrm" method="post"
							ation="<c:url value='/userPrm/update'/>">
							<table class="gridTable" id="dtTable">
								<tr>
									<td class="title">Page</td>
									<td class="title">Read</td>
									<td class="title">Create</td>
									<td class="title">Update</td>
									<td class="title">Delete</td>
								</tr>
								<c:out value="${tableRows}" escapeXml="false" />
							</table>
						</form>
					</c:if>
				</div>
			</c:if>
		</div>
	</main>
	<script>
	function editUser(userId){
		const formUser = document.getElementById('formUser');
		if (formUser) formUser.setAttribute('action', '<c:url value="/userPrm/get"/>');
            
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
	    document.getElementById('formUser').submit();
	}
	
	function validateForm(){
		const hiddenForm = document.createElement('form');
		hiddenForm.setAttribute('action', '<c:url value="/userPrm/update"/>');
		hiddenForm.setAttribute('method','post');
		
		userIdField = document.getElementById('userId');
		hiddenForm.appendChild(userIdField);
		
		//get data from rows
		const rows = document.querySelectorAll('#dtTable tr');
		rows.forEach((row, index) => {
			if (index === 0) return; // Skip the header row
			
			const cells = row.querySelectorAll('td');
			const pageName = cells[0].innerText.trim();
			const readCheckbox = cells[1].querySelector('input[type="checkbox"]');
	        const createCheckbox = cells[2].querySelector('input[type="checkbox"]');
	        const updateCheckbox = cells[3].querySelector('input[type="checkbox"]');
	        const deleteCheckbox = cells[4].querySelector('input[type="checkbox"]');
	        
	        // Only store if the "Read" checkbox is checked
	        if(readCheckbox.checked){
	        	
	            const hiddenRead = document.createElement('input');
	            hiddenRead.type = 'hidden';
	            hiddenRead.name = pageName + '_read';
	            hiddenRead.value = 'true';
	            hiddenForm.appendChild(hiddenRead);

	            const hiddenCreate = document.createElement('input');
	            hiddenCreate.type = 'hidden';
	            hiddenCreate.name = pageName + '_create';
	            hiddenCreate.value = createCheckbox.checked ? 'true' : 'false';
	            hiddenForm.appendChild(hiddenCreate);

	            const hiddenUpdate = document.createElement('input');
	            hiddenUpdate.type = 'hidden';
	            hiddenUpdate.name = pageName + '_update';
	            hiddenUpdate.value = updateCheckbox.checked ? 'true' : 'false';
	            hiddenForm.appendChild(hiddenUpdate);

	            const hiddenDelete = document.createElement('input');
	            hiddenDelete.type = 'hidden';
	            hiddenDelete.name = pageName + '_delete';
	            hiddenDelete.value = deleteCheckbox.checked ? 'true' : 'false';
	            hiddenForm.appendChild(hiddenDelete);
	            
	        }
			
		});
		 document.body.appendChild(hiddenForm);
		 hiddenForm.submit();
	}
	</script>
</body>
</html>
