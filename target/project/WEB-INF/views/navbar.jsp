<nav class="sticky navbar">
		<a href="./${sessionScope.landingPage }" class="logo_button">Johor
			TVPSS Management Information System</a>

		<div class="nav">
			<ul class="nav-items">
				<li class="nav-item">
					<form action="AdminServlet" class="search-bar" method="post"
						style="display: flex;">
						<input type="search" name="search" pattern=".*\S.*" size="30"
							placeholder="Search" required>
						<button class="search-btn" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</li>
				<li class="nav-item">
					<button>
						<i class="fa fa-bell"></i>
					</button>
				</li>
				<li>
				<div class="left">
				<span class="name">${sessionScope.user.username}</span>
				<span class="role">${sessionScope.user.type }</span>
				</div>
				<div class="right">
				<div class="profile-picture circular">
									<img src="img/profile_pic.png" alt="Profile">
								</div>
				</div>
				</li>
			</ul>
		</div>
	</nav>