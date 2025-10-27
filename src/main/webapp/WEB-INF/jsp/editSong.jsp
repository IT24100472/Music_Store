<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Edit Song Details - Music Store</title>
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

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
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
    </style>
</head>
<body>
<div class="edit-container">
    <div class="header">
        <h1><i class="fas fa-edit mr-2"></i>Edit Song Details</h1>
        <p>Update your song information</p>
    </div>

    <form action="/artist/edit/${song.MID}" method="post" class="space-y-6">
        <div class="form-group">
            <label class="form-label"><i class="fas fa-music mr-2"></i>Title</label>
            <input type="text" name="title" value="${song.name}" class="form-input purple-focus" required>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-user mr-2"></i>Artist</label>
            <input type="text" name="artist" value="${song.artist}" class="form-input purple-focus" required>
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-users mr-2"></i>Band</label>
            <input type="text" name="band" value="${song.band}" class="form-input purple-focus">
        </div>

        <div class="form-group">
            <label class="form-label"><i class="fas fa-tag mr-2"></i>Price</label>
            <input type="text" name="price" value="${song.price}" class="form-input purple-focus" required>
        </div>

        <button type="submit" class="w-full btn-purple text-white font-medium py-3.5 rounded-lg transition">
            <i class="fas fa-save mr-2"></i>Update Song
        </button>
    </form>

    <a href="javascript:history.back()" class="back-link">
        <i class="fas fa-arrow-left mr-2"></i> Back to Dashboard
    </a>
</div>
</body>
</html>