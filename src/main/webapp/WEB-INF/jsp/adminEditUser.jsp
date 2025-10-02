<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="adminnavbar.jsp"%>
<html>
<head>
    <title>Edit User - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .edit-container {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .edit-container:hover {
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 1rem;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #6b21a8;
            margin-bottom: 0.5rem;
        }

        .header p {
            color: #718096;
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #4a5568;
            font-size: 1rem;
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

        .form-select {
            width: 100%;
            background: #f9fafb;
            color: #1a202c;
            padding: 12px 16px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-select:focus {
            outline: none;
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
        }

        .btn-update {
            width: 100%;
            background: #7c3aed;
            color: white;
            padding: 12px 16px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 1rem;
        }

        .btn-update:hover {
            background: #6d28d9;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(124, 58, 237, 0.3);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            margin-top: 1.5rem;
            color: #7c3aed;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #6d28d9;
        }

        .user-info {
            background: #f0f4f8;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            border-left: 4px solid #7c3aed;
        }

        .user-info p {
            margin: 5px 0;
            color: #4a5568;
        }

        .user-id {
            font-weight: 600;
            color: #7c3aed;
        }
    </style>
</head>
<body>
<div class="edit-container">
    <div class="header">
        <h1><i class="fas fa-user-edit mr-2"></i>Edit User</h1>
        <p>Update user information</p>
    </div>

    <div class="user-info">
        <p><span class="user-id">User ID:</span> ${user.id}</p>
        <p><span class="user-id">Current Email:</span> ${user.email}</p>
    </div>

    <form action="/admin/edit/${user.id}" method="post">
        <div class="form-group">
            <label class="form-label"><i class="fas fa-user mr-2"></i>First name</label>
            <input type="text" name="firstname" value="${user.firstName}" class="form-input" required/>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-user mr-2"></i>Last name</label>
            <input type="text" name="lastname" value="${user.lastName}" class="form-input" required/>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-envelope mr-2"></i>Email</label>
            <input type="text" name="email" value="${user.email}" class="form-input" required/>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-user-tag mr-2"></i>User type</label>
            <select name="usertype" id="usertype" class="form-select">
                <option value="admin" <c:if test="${user.userType eq 'admin'}">selected</c:if>>Admin</option>
                <option value="user" <c:if test="${user.userType eq 'user'}">selected</c:if>>User</option>
                <option value="artist" <c:if test="${user.userType eq 'artist'}">selected</c:if>>Artist</option>
            </select>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-lock mr-2"></i>Password</label>
            <input type="password" name="password" class="form-input"/>
            <p style="font-size: 0.875rem; color: #718096; margin-top: 5px;">Don't type anything if you don't need to change the password</p>
        </div>

        <button type="submit" class="btn-update">
            <i class="fas fa-save mr-2"></i> Update User
        </button>
    </form>

    <a href="/admin" class="back-link">
        <i class="fas fa-arrow-left mr-2"></i> Back to User Management
    </a>
</div>
</body>
</html>