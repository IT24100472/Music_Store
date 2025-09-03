<%--
  Created by IntelliJ IDEA.
  User: sasan_5omyce5
  Date: 9/3/2025
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="authCheck.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<!-- User form -->
<form action="#" method="post">
<label>First name</label>
<input type="text" name="firstname" value="${user.firstName}"/>
<label>Last name</label>
<input type="text" name="lastname" value="${user.lastName}"/>
<label>User type</label>
<input type="text" name="usertype" value="${user.userType}" readonly/>
<label>Email</label>
<input type="text" name="email" value="${user.email}"/>
<label>Password</label>
<input type="password" name="password"/>
<label>Confirm password</label>
<input type="password" name="confirm_password"/>
<input type="submit" value="Update Profile"/>
</form>
<form action="#" method="post">
    <input type="hidden" value="${user.id}">
<input type="submit" value="Delete profile"/>
</form>
</body>
</html>
