<%@ page import="com.entity.User, java.util.Map" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
    // Retrieve the logged-in user from the session
    User user = (User) session.getAttribute("user");
%>
<div class="sidenav" style="position:sticky">
	<ul class="sidenav-items">
	 <% //if (permissions != null) { 
        //for (Map.Entry<Page, String[]> entry : permissions.entrySet()) {
           // Page sidepage = entry.getKey();
            //String[] allowedActions = entry.getValue();

            // Display the tab only if the user has "Read" permission for the page
            //boolean hasReadPermission = false;
            //for (String action : allowedActions) {
              //  if ("Read".equalsIgnoreCase(action)) {
                	 %>
                     <li  class="sidenav-item">
                         <i class="" aria-hidden="true"></i>
                         <a class="desc" href=""></a>
                     </li>
         <%
     //               break;
      //          }
       //     }
        //}
    //} else { %>
        <li>No pages available</li>
    <% //}%>
		<li class="sidenav-item"><i class="fa fa-sign-out"
			aria-hidden="true"></i><a class="desc" href="<%= request.getContextPath() + "/logout"%>">Log Out</a></li>
	</ul>
</div>