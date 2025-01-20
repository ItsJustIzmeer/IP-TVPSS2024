<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
<style>
.overlay {
	background-image: url("<c:url value='/resources/img/login.png'/>")
}
</style>
<meta charset="UTF-8">
<title>TVPSS Login</title>
</head>
<body>
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
	<div class="container" id="container">
		<!-- 
		<div class="form-container sign-up-container">
			<form method="post" action="<c:url value='/user/sign-up' />">
				<h1>Create Account</h1>
				<span>Use your email for registration</span> <input type="text"
					placeholder="Name" name="username" required /> <input type="email"
					placeholder="Email" name="email" required /> <input
					type="password" placeholder="Password" name="password" required />
				<button>Sign Up</button>
			</form>
		</div>
		 -->
		<div class="form-container sign-in-container">
			<form method="post" action="<c:url value='/user/sign-in' />">
				<h1>Sign in</h1>
				<input type="text" placeholder="Username" name="username" required />
				<input type="password" placeholder="Password" name="password"
					required />
				<div class="line_bar" style="width: 100%">
					<div class="line_bar">
						<input type="checkbox" name="terms_conditions"
							id="terms_conditions" value="terms_conditions"
							style="margin: 0px; width: fit-content;" required checked>
						<label for="terms_condition">Terms & Conditions</label>
					</div>
					<a href="#">Forgot your password?</a>
				</div>
				<button>Sign In</button>
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>Welcome Back, User</h1>
					<p>Welcome back! Please enter your details.</p>
				</div>
			</div>
		</div>
	</div>
	<footer> </footer>
	<script>
		/*
		const signUpButton = document.getElementById('signUp');
		const signInButton = document.getElementById('signIn');
		const container = document.getElementById('container');
		
		signUpButton.addEventListener('click', () => {
			container.classList.add("right-panel-active");
		});
		
		signInButton.addEventListener('click', () => {
			container.classList.remove("right-panel-active");
		});
		 */
	</script>
</body>
</html>