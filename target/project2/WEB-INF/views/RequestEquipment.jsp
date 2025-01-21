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
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f4f4f9;
}

.container {
	max-width: 600px;
	margin: auto;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
}

input, select, textarea, button {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<!-- nav bar page-->
	<jsp:include page="navbar.jsp" />
	<main>
		<!-- side menu page -->
		<jsp:include page="sidenav.jsp" />

		<!-- main body -->
		<div class="main-body" style="width: -webkit-fill-available;">
			<div class="maintitle">${sessionScope.currPage.title}</div>
			<div class="main-container">
				<!-- start of main content -->
				<div class="container">
					<h1>Request Equipment</h1>
					<form id="equipmentRequestForm">
						<!-- General Request Details -->
						<!--  
						<label for="school-id">School ID</label> <input type="text"
							id="school-id" name="school_id" required> <label
							for="admin-id">Admin ID</label> <input type="text" id="admin-id"
							name="admin_id" required> <label for="request-date">Request
							Date</label> <input type="date" id="request-date" name="request_date"
							required>
 -->
						<!-- Item Details -->
						<label for="itemName">Item Name</label> <input type="text"
							id="itemName" name="item_name" required> <label
							for="itemModel">Item Model</label> <input type="text"
							id="itemModel" name="item_model" required> <label
							for="itemPrice">Item Price (per unit)</label> <input
							type="number" id="itemPrice" name="item_price" step="0.01"
							required> <label for="quantity">Quantity</label> <input
							type="number" id="quantity" name="quantity" required> <label
							for="totalCost">Total Estimated Cost</label> <input type="number"
							id="totalCost" name="total_cost" readonly>

						<!-- Quotation or Ecommerce Link -->
						<label>Quotation or Ecommerce Link (fill either one):</label>
						<div class="side-by-side">
							<div>
								<label for="quotation">Upload Quotation</label> <input
									type="file" id="quotation" name="quotation"
									accept=".pdf,.docx,.jpg,.png">
							</div>
							<div>
								<label for="ecommerceLink">Ecommerce Link</label> <input
									type="url" id="ecommerceLink" name="ecommerce_link">
							</div>
						</div>

						<label for="reason">Reason for Request</label>
						<textarea id="reason" name="reason" rows="3" required></textarea>

						<label for="supportingDocuments">Supporting Documents</label> <input
							type="file" id="supportingDocuments" name="supporting_documents"
							accept=".pdf,.docx,.jpg,.png">


						<!-- Submit Button -->
						<button type="submit">Submit Request</button>
					</form>
				</div>

				<!--  end of main content -->
			</div>
		</div>
	</main>
</body>
<script>
	// Calculate Total Cost based on price and quantity
	const itemPrice = document.getElementById('item-price');
	const quantity = document.getElementById('quantity');
	const totalCost = document.getElementById('total-cost');

	function updateTotalCost() {
		const price = parseFloat(itemPrice.value) || 0;
		const qty = parseInt(quantity.value) || 0;
		totalCost.value = (price * qty).toFixed(2);
	}

	itemPrice.addEventListener('input', updateTotalCost);
	quantity.addEventListener('input', updateTotalCost);
</script>

<script>
        // Handle form submission
        document.getElementById('equipmentRequestForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form from reloading the page

            var userId = "<%=session.getAttribute("loggedInUser").getId()%>";
            var schoolId = "<%=session.getAttribute("loggedInUser").getId()%>";

            
            // Get the form data
			const formData = {
			    schoolId:schoolId,
			    userId: userId,
			    itemName: document.getElementById('itemName').value,
			    itemModel: document.getElementById('itemModel').value,
			    itemPrice: document.getElementById('itemPrice').value, // Updated to match camel case
			    quantity: document.getElementById('quantity').value,
			    totalCost: document.getElementById('totalCost').value, // Updated to match camel case
			    quotationFileData: document.getElementById('quotation').value, // Updated to match camel case
			    ecommerceLink: document.getElementById('ecommerceLink').value,
			    reasonForRequest: document.getElementById('reason').value, // Updated to match camel case
			    supportingDocumentFileData: document.getElementById('supportingDocuments').value // Updated to match camel case
			};


            // Send POST request using fetch API
            fetch('/requestEquipment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData) // Convert form data to JSON
            })
            .then(response => response.json())
            .then(data => {
                alert('Request submitted successfully!');
                console.log(data);
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error submitting request.');
            });
        });
    </script>
</html>
