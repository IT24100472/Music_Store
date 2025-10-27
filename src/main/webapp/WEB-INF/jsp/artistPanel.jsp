<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Artist Portal - Music Store</title>
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
            background: linear-gradient(135deg, #06111c 0%, #4c1d95 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .portal-container {
            width: 100%;
            max-width: 600px;
            background: rgba(248, 248, 248, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .portal-container:hover {
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        .purple-focus:focus {
            border-color: #8b5cf6;
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.3);
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
            color: #b130c5;
            border: 1px solid #feb2b2;
        }

        .btn-purple {
            background: #ed3ade;
            transition: all 0.3s ease;
        }

        .btn-purple:hover {
            background: #6d28d9;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(124, 58, 237, 0.3);
        }


        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4a5568;
            font-size: 1.1rem;
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

        .file-input-container {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-input {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-input-label {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px 16px;
            background: #f9fafb;
            border: 1px dashed #d1d5db;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-input-label:hover {
            border-color: #8b5cf6;
            background: #f3f4f6;
        }

        .file-input-icon {
            margin-right: 8px;
            color: #3aeda8;
        }
    </style>
</head>
<body>
<div class="portal-container">
    <div class="header">
        <h1><i class="fas fa-microphone-alt mr-2"></i>Artist Portal</h1>
        <p>Upload your music to the Music Store</p>
    </div>

    <c:if test="${not empty success}">
        <div class="mb-6 p-4 bg-purple-100 text-purple-700 rounded-lg border border-purple-200 flex items-center">
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

    <form action="/artist/upload" method="post" enctype="multipart/form-data" class="space-y-6">
        <div class="form-group">
            <label class="form-label"><i class="fas fa-music mr-2"></i>Song title</label>
            <input type="text" name="songName" class="form-input purple-focus" required>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-file-audio mr-2"></i>Song file</label>
            <div class="file-input-container">
                <input type="file" name="songFile" accept="audio/*" class="file-input" required>
                <label class="file-input-label">
                    <i class="fas fa-upload file-input-icon"></i>
                    <span>Choose an audio file</span>
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-user mr-2"></i>Artist name</label>
            <input type="text" name="artist" class="form-input purple-focus" required>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-users mr-2"></i>Band name <span class="text-gray-500">(optional)</span></label>
            <input type="text" name="band" placeholder="Optional" class="form-input purple-focus">
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-tag mr-2"></i>Price</label>
            <input type="text" name="price" class="form-input purple-focus" required>
        </div>

        <button type="submit" class="w-full btn-purple text-white font-medium py-3.5 rounded-lg transition">
            <i class="fas fa-cloud-upload-alt mr-2"></i>Upload Song
        </button>
    </form>
</div>
</body>
</html>