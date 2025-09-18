<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="navbar.jsp"%>

<%--
  Created by IntelliJ IDEA.
  User: sasan_5omyce5
  Date: 9/1/2025
  Time: 7:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Music Store</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 440px;
            padding: 40px;
            transition: all 0.3s ease;
        }

        .login-container:hover {
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

        .music-icon {
            display: inline-block;
            margin-right: 8px;
        }

        .validation-error {
            display: none;
            color: #e53e3e;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        .input-error {
            border-color: #e53e3e;
            box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="text-center mb-8">
        <h1 class="text-3xl font-bold text-purple-900 mb-2 flex items-center justify-center">
            <span class="music-icon">🎵</span> Music Store
        </h1>
        <p class="text-gray-600">Sign in to your account</p>
    </div>

    <c:if test="${not empty error}">
        <div class="mb-6 p-4 bg-red-100 text-red-700 rounded-lg border border-red-200 flex items-center">
            <i class="fas fa-exclamation-circle mr-2"></i>
                ${error}
        </div>
    </c:if>

    <form id="loginForm" action="/user/login" method="post" class="space-y-5">
        <div>
            <input type="text" name="email" id="email" placeholder="E-mail address" class="w-full bg-gray-50 text-gray-800 px-5 py-4 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
            <div id="emailError" class="validation-error">
                <i class="fas fa-exclamation-circle mr-1"></i> Please enter a valid email address
            </div>
        </div>

        <div>
            <input type="password" name="password" placeholder="Password" class="w-full bg-gray-50 text-gray-800 px-5 py-4 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
        </div>

        <input type="submit" value="Login" class="w-full btn-purple text-white font-medium py-4 rounded-lg text-lg transition cursor-pointer">
    </form>

    <div class="text-center mt-8">
        <p class="text-gray-600">Don't have an account? <a href="/user/register" class="text-purple-700 font-medium hover:text-purple-800">Sign up</a></p>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const loginForm = document.getElementById('loginForm');
        const emailInput = document.getElementById('email');
        const emailError = document.getElementById('emailError');

        // Email validation function
        function isValidEmail(email) {
            // Regular expression for basic email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // Validate email on form submission
        loginForm.addEventListener('submit', function(event) {
            const email = emailInput.value.trim();

            if (!isValidEmail(email)) {
                event.preventDefault();
                emailError.style.display = 'block';
                emailInput.classList.add('input-error');

                // Focus on the email input
                emailInput.focus();
            } else {
                emailError.style.display = 'none';
                emailInput.classList.remove('input-error');
            }
        });

        // Clear error when user starts typing
        emailInput.addEventListener('input', function() {
            if (emailError.style.display === 'block') {
                emailError.style.display = 'none';
                emailInput.classList.remove('input-error');
            }
        });
    });
</script>
</body>
</html>