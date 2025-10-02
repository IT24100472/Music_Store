<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="adminnavbar.jsp"%>
<html>
<head>
    <title>Music Management - Admin</title>
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
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            text-align: center;
            border-left: 4px solid #7c3aed;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #7c3aed;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            color: #718096;
            font-size: 0.9rem;
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
            min-width: 1000px;
        }

        th {
            background-color: #7c3aed;
            color: white;
            padding: 12px 16px;
            text-align: left;
            font-weight: 500;
            position: sticky;
            top: 0;
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
            vertical-align: middle;
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
            font-size: 0.875rem;
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
            font-size: 0.875rem;
        }

        .btn-delete:hover {
            background-color: #dc2626;
            transform: translateY(-1px);
        }

        .action-cell {
            display: flex;
            gap: 8px;
        }

        audio {
            width: 150px;
            height: 40px;
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

        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: 500;
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

        .badge-admin {
            background-color: #7c3aed;
            color: white;
        }

        .badge-user {
            background-color: #10b981;
            color: white;
        }

        .badge-artist {
            background-color: #f59e0b;
            color: white;
        }

        @media (max-width: 768px) {
            .admin-container {
                padding: 20px;
            }

            .action-cell {
                flex-direction: column;
            }

            audio {
                width: 120px;
            }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="header">
            <h1><i class="fas fa-music mr-2"></i>Music Management</h1>
            <p>Admin panel for managing all music content</p>
            <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle mr-2"></i>
                ${error}
            </div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle mr-2"></i>
                ${success}
            </div>
        </c:if>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-number">${not empty songs ? songs.size() : 0}</div>
                <div class="stat-label">Total Songs</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:set var="artistCount" value="0" />
                    <c:forEach var="song" items="${songs}">
                        <c:if test="${not empty song.userName}">
                            <c:set var="artistCount" value="${artistCount + 1}" />
                        </c:if>
                    </c:forEach>
                    ${artistCount}
                </div>
                <div class="stat-label">Artists</div>
            </div>
            <div class="stat-card">
                <div class="stat-number">
                    <c:set var="totalPrice" value="0" />
                    <c:forEach var="song" items="${songs}">
                        <c:set var="totalPrice" value="${totalPrice + song.price}" />
                    </c:forEach>
                    $${totalPrice}
                </div>
                <div class="stat-label">Total Value</div>
            </div>
        </div>

        <c:if test="${not empty songs}">
            <div class="table-container">
                <table id="songsTable">
                    <thead>
                        <tr>
                            <th>User</th>
                            <th>Music ID</th>
                            <th>Title</th>
                            <th>Artist</th>
                            <th>Band</th>
                            <th>Song</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="songs" items="${songs}">
                            <tr>
                                <td>
                                    <span class="badge badge-artist">${songs.userName}</span>
                                </td>
                                <td>${songs.MID}</td>
                                <td>${songs.name}</td>
                                <td>${songs.artist}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty songs.band}">${songs.band}</c:when>
                                        <c:otherwise>—</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <audio controls>
                                        <c:choose>
                                            <c:when test="${songs.fileType eq 'mp3'}">
                                                <source src="/artist/play/${songs.MID}" type="audio/mpeg" />
                                            </c:when>
                                            <c:when test="${songs.fileType eq 'wav'}">
                                                <source src="/artist/play/${songs.MID}" type="audio/wav" />
                                            </c:when>
                                            <c:when test="${songs.fileType eq 'ogg'}">
                                                <source src="/artist/play/${songs.MID}" type="audio/ogg" />
                                            </c:when>
                                            <c:otherwise>
                                                <source src="/artist/play/${songs.MID}" type="application/octet-stream" />
                                            </c:otherwise>
                                        </c:choose>
                                    </audio>
                                </td>
                                <td>$${songs.price}</td>
                                <td class="action-cell">
                                    <form action="/admin/music/edit/${songs.MID}" method="get" style="display:inline;">
                                        <button type="submit" class="btn-edit">
                                            <i class="fas fa-edit mr-1"></i> Edit
                                        </button>
                                    </form>
                                    <form action="/admin/music/delete/${songs.MID}" method="post" style="display:inline;">
                                        <button type="submit" onclick="return confirm('Are you sure you want to delete this song?');" class="btn-delete">
                                            <i class="fas fa-trash-alt mr-1"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty songs}">
            <div class="empty-state">
                <i class="fas fa-music"></i>
                <h3>No music found</h3>
                <p>There are no songs in the system yet</p>
            </div>
        </c:if>
    </div>

    <script>
        // Add confirmation for delete action
        document.addEventListener('DOMContentLoaded', function() {
            const deleteButtons = document.querySelectorAll('.btn-delete');
            deleteButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to delete this song?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>