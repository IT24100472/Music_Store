<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="adminnavbar.jsp"%>
<html>
<head>
    <title>User Management - Admin Dashboard</title>
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
        }

        .admin-container {
            max-width: 1400px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .admin-container:hover {
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .header {
            text-align: center;
            margin-bottom: 2rem;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 1rem;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #6b21a8;
            margin-bottom: 0.5rem;
        }

        .header p {
            color: #718096;
            font-size: 1.1rem;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: linear-gradient(135deg, #7c3aed 0%, #6d28d9 100%);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .alert-error {
            background-color: #fed7d7;
            color: #c53030;
            border: 1px solid #feb2b2;
        }

        .alert-success {
            background-color: #c6f6d5;
            color: #22543d;
            border: 1px solid #9ae6b4;
        }

        .table-container {
            overflow-x: auto;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #7c3aed;
            color: white;
            padding: 12px 16px;
            text-align: left;
            font-weight: 500;
        }

        tr {
            border-bottom: 1px solid #e2e8f0;
            transition: background-color 0.2s;
        }

        tr:hover {
            background-color: #f8fafc;
        }

        td {
            padding: 12px 16px;
            color: #4a5568;
        }

        .user-type {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .user-type-admin {
            background-color: #fed7d7;
            color: #c53030;
        }

        .user-type-artist {
            background-color: #e9d8fd;
            color: #553c9a;
        }

        .user-type-user {
            background-color: #c6f6d5;
            color: #22543d;
        }

        .action-cell {
            display: flex;
            gap: 8px;
        }

        .btn-edit {
            background-color: #f59e0b;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .btn-edit:hover {
            background-color: #d97706;
            transform: translateY(-1px);
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .btn-delete:hover {
            background-color: #dc2626;
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: #718096;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #a0aec0;
        }

        .password-cell {
            font-family: monospace;
            font-size: 0.9rem;
            color: #718096;
        }

        @media (max-width: 768px) {
            .stats-container {
                grid-template-columns: 1fr;
            }

            th, td {
                padding: 8px 12px;
            }

            .action-cell {
                flex-direction: column;
            }
        }

        .btn-add {
            background: #10b981;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            font-weight: 500;
            text-decoration: none;
            float: right;
        }

        .btn-add:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="header">
            <h1><i class="fas fa-users-cog mr-2"></i>User Management</h1>
            <p>Manage all users in the system</p>
        </div>

        <c:if test="${not empty success}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle mr-2"></i>
                ${success}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle mr-2"></i>
                ${error}
            </div>
        </c:if>

        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-number">
                    <c:choose>
                        <c:when test="${not empty users}">${users.size()}</c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose>
                </div>
                <div class="stat-label">Total Users</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:if test="${not empty users}">
                        <c:set var="adminCount" value="0" />
                        <c:forEach var="user" items="${users}">
                            <c:if test="${user.userType == 'admin'}">
                                <c:set var="adminCount" value="${adminCount + 1}" />
                            </c:if>
                        </c:forEach>
                        ${adminCount}
                    </c:if>
                    <c:if test="${empty users}">0</c:if>
                </div>
                <div class="stat-label">Admin Users</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:if test="${not empty users}">
                        <c:set var="artistCount" value="0" />
                        <c:forEach var="user" items="${users}">
                            <c:if test="${user.userType == 'artist'}">
                                <c:set var="artistCount" value="${artistCount + 1}" />
                            </c:if>
                        </c:forEach>
                        ${artistCount}
                    </c:if>
                    <c:if test="${empty users}">0</c:if>
                </div>
                <div class="stat-label">Artists</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:if test="${not empty users}">
                        <c:set var="userCount" value="0" />
                        <c:forEach var="user" items="${users}">
                            <c:if test="${user.userType == 'user'}">
                                <c:set var="userCount" value="${userCount + 1}" />
                            </c:if>
                        </c:forEach>
                        ${userCount}
                    </c:if>
                    <c:if test="${empty users}">0</c:if>
                </div>
                <div class="stat-label">Regular Users</div>
            </div>
        </div>

        <a href="/admin/add" class="btn-add">
                <i class="fas fa-user-plus mr-2"></i> Add New User
            </a>
<br><br><br>
        <c:choose>
            <c:when test="${not empty users}">
                <div class="table-container">
                    <table id="userTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>User Type</th>
                                <th>Password</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <span class="user-type user-type-${user.userType}">
                                            ${user.userType}
                                        </span>
                                    </td>
                                    <td class="password-cell">${user.password}</td>
                                    <td class="action-cell">
                                        <form action="/admin/edit/${user.id}" method="get" style="display:inline;">
                                            <button type="submit" class="btn-edit">
                                                <i class="fas fa-edit mr-1"></i> Edit
                                            </button>
                                        </form>
                                        <form action="/admin/delete/${user.id}" method="get" style="display:inline;">
                                            <button type="submit" onclick="return confirm('Are you sure you want to delete this user?');" class="btn-delete">
                                                <i class="fas fa-trash-alt mr-1"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-users-slash"></i>
                    <h3>User List is Empty</h3>
                    <p>No users found in the system</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        // Add confirmation for delete action
        document.addEventListener('DOMContentLoaded', function() {
            const deleteButtons = document.querySelectorAll('.btn-delete');
            deleteButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to delete this user?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>