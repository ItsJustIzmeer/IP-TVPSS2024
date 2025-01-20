<%@ page import="com.entity.User, java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<div class="sidenav" style="position:sticky">
	<ul class="sidenav-items">
	 <c:forEach var="permission" items="${userPermissions}">
	 <li class="sidenav-item" onclick="window.location.href='<%= request.getContextPath()%>/${permission.pageFilename};jsessionid=<%= session.getId() %>'"><i class="${permission.pageIcon}"></i>${permission.pageTitle}</li>
	 </c:forEach>
		<li class="sidenav-item" onclick="window.location.href='<%= request.getContextPath()%>/user/sign-out'"><i class="fa fa-sign-out"
			aria-hidden="true"></i>Log Out</li>
	</ul>
</div>