<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<style>
.overlay{
background-image: url("<c:url value='resources/img/login.png'/>")}
</style>
<meta charset="UTF-8">
<title>TVPSS Login</title>
</head>
<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form method="post" action="LoginServlet">
				<h1>Create Account</h1>
				<span>Use your email for registration</span> <input type="text"
					placeholder="Name" name="username" required /> <input type="email"
					placeholder="Email" name="email" required /> <input
					type="password" placeholder="Password" name="password" required />
				<input type="hidden" name="action" value="sign-up" />
				<button>Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form method="post" action="LoginServlet">
				<h1>Sign in</h1>
				<input type="text" placeholder="Username" name="username" required />
				<input type="password" placeholder="Password" name="password"
					required />
				<div class="line_bar" style="width: 100%">
					<div class="line_bar">
						<input type="checkbox" name="terms_conditions"
							id="terms_conditions" value="terms_conditions"
							style="margin: 0px; width: fit-content;" required> <label
							for="terms_condition">Terms & Conditions</label>
					</div>
					<a href="#">Forgot your password?</a>
				</div>
				<input type="hidden" name="action" value="sign-in" />
				<button>Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back, User</h1>
					<p>Welcome back! Please enter your details.</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Enter your personal details and start journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
	<footer> </footer>
	<script>
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');
	
	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});
	
	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});
	</script>
</body>
</html>