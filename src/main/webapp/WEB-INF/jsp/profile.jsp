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
    <title>User Profile - Music Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6b21a8 0%, #4c1d95 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .profile-container {
            max-width: 600px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .profile-container:hover {
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .purple-focus:focus {
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
        }

        .btn-purple {
            background: #7c3aed;
            transition: all 0.3s ease;
        }

        .btn-purple:hover {
            background: #6d28d9;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(124, 58, 237, 0.3);
        }

        .btn-red {
            background: #e53e3e;
            transition: all 0.3s ease;
        }

        .btn-red:hover {
            background: #c53030;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(229, 62, 62, 0.3);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4a5568;
        }

        .form-input {
            width: 100%;
            background: #f9fafb;
            color: #1a202c;
            padding: 12px 16px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
        }

        .form-input[readonly] {
            background-color: #edf2f7;
            cursor: not-allowed;
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #6b21a8;
            margin-bottom: 0.5rem;
        }

        .header p {
            color: #718096;
        }

        .divider {
            height: 1px;
            background: #e2e8f0;
            margin: 2rem 0;
        }
    </style>
</head>
<body class="flex justify-center items-start pt-20 pb-10 px-4">
    <div class="profile-container">
        <div class="header">
            <h1><i class="fas fa-user-circle mr-2"></i>User Profile</h1>
            <p>Manage your account settings</p>
        </div>

        <c:if test="${not empty success}">
            <div class="mb-6 p-4 bg-purple-100 text-purple-700 rounded-lg border border-purple-200 flex items-center">
                <i class="fas fa-check-circle mr-2"></i>
                ${success}
            </div>
        </c:if>

        <!-- User form -->
        <form action="/user/updateprofile" method="post" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="form-group">
                    <label class="form-label">First name</label>
                    <input type="text" name="firstname" value="${user.firstName}" class="form-input purple-focus" required/>
                </div>

                <div class="form-group">
                    <label class="form-label">Last name</label>
                    <input type="text" name="lastname" value="${user.lastName}" class="form-input purple-focus" required/>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">User type</label>
                <input type="text" name="usertype" value="${user.userType}" class="form-input" readonly/>
            </div>

            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" name="email" value="${user.email}" class="form-input purple-focus" required/>
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <input type="password" name="password" placeholder="Enter new password" class="form-input purple-focus"/>
                <p class="text-sm text-gray-500 mt-1">Leave blank to keep current password</p>
            </div>

            <div class="form-group">
                <label class="form-label">Confirm password</label>
                <input type="password" name="confirm_password" placeholder="Confirm new password" class="form-input purple-focus"/>
            </div>

            <button type="submit" class="w-full btn-purple text-white font-medium py-3.5 rounded-lg transition">
                <i class="fas fa-save mr-2"></i>Update Profile
            </button>
        </form>

        <div class="divider"></div>

        <form action="/user/deleteprofile" method="get" onsubmit="return handleDeleteProfile(event);">
            <button type="submit" class="w-full btn-red text-white font-medium py-3.5 rounded-lg transition">
                <i class="fas fa-trash-alt mr-2"></i>Delete Profile
            </button>
        </form>
    </div>

    <script>
        function handleDeleteProfile(event) {
            if (!confirm("Are you sure you want to delete your profile? This action cannot be undone.")) {
                return false; // cancel the form submission
            }

            // Delete cookies
            document.cookie = "login=false; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            document.cookie = "role=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";

            // Allow form to submit after cookies are cleared
            return true;
        }
    </script>
</body>
</html>