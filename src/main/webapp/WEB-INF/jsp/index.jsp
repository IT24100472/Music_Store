<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="w-full md:w-1/2 bg-white flex flex-col justify-center items-center px-6 sm:px-10 py-10 ml-auto">

    <div class="w-full max-w-md">
        <h2 class="text-2xl font-bold mb-6 text-gray-800 text-center">Create an account</h2>

<div class="w-full md:w-1/2 bg-white flex flex-col justify-center items-center px-3 sm:px-2 py-10 ml-auto mr-10">
    <form action="user/register" method="post">
        <input type="text" name="firstname" placeholder="First Name" class="w-[400px] bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500" required><br>
        <input type="text" name="lastname" placeholder="Last Name" class="w-full bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500" required><br>
        <input type="email" name="email" placeholder="E-mail address" class="w-full bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500" required><br>
        <select name="usertype" id="usertype" class="w-full bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500 text-gray-700">
            <option value="user">User</option>
            <option value="artist">Artist</option>
        </select><br>
        <input type="password" name="password" placeholder="Password" class="w-full bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500" required><br>
        <input type="password" name="confirmpassword" placeholder="Retype Password" class="w-full bg-gray-100 text-sm px-4 py-3 mb-4 rounded-md focus:outline-none focus:ring-2 focus:ring-orange-500" required><br>
        <button type="submit" class="w-full bg-orange-500 text-white font-medium py-3 rounded-md hover:bg-orange-600 transition">Register</button>
    </form>
</div>
</div>
</div>
</body>
</html>
