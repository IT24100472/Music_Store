<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Music Dashboard - Music Store</title>
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

        .dashboard-container {
            max-width: 1200px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .dashboard-container:hover {
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

        .table-container {
            overflow-x: auto;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
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

        .btn-edit {
            background-color: #f59e0b;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            transition: all 0.3s;
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
            transition: all 0.3s;
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

        .action-cell {
            display: flex;
            gap: 8px;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                padding: 20px;
            }

            th, td {
                padding: 8px 12px;
            }

            .action-cell {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="header">
            <h1><i class="fas fa-compact-disc mr-2"></i>Music Dashboard</h1>
            <p>Manage your uploaded songs</p>
        </div>

        <c:if test="${not empty success}">
            <div class="mb-6 p-4 bg-purple-100 text-purple-700 rounded-lg border border-purple-200 flex items-center">
                <i class="fas fa-check-circle mr-2"></i>
                ${success}
            </div>
        </c:if>

        <c:if test="${not empty notFound}">
            <div class="mb-6 p-4 bg-purple-100 text-purple-700 rounded-lg border border-purple-200 flex items-center">
                <i class="fas fa-info-circle mr-2"></i>
                ${notFound}
            </div>
        </c:if>

        <c:choose>
            <c:when test="${not empty mySongs}">
                <div class="table-container">
                    <table id="songsTable">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Artist</th>
                                <th>Band</th>
                                <th>Song</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="mySongs" items="${mySongs}">
                                <tr>
                                    <td>${mySongs.name}</td>
                                    <td>${mySongs.artist}</td>
                                    <td>${mySongs.band}</td>
                                    <td><audio controls>
                                    <c:choose>
                                        <c:when test="${mySongs.fileType eq 'mp3'}">
                                            <source src="/artist/play/${mySongs.MID}" type="audio/mpeg" />
                                        </c:when>
                                        <c:when test="${mySongs.fileType eq 'wav'}">
                                            <source src="/artist/play/${mySongs.MID}" type="audio/wav" />
                                        </c:when>
                                        <c:when test="${mySongs.fileType eq 'ogg'}">
                                            <source src="/artist/play/${mySongs.MID}" type="audio/ogg" />
                                        </c:when>
                                        <c:otherwise>
                                            <source src="/artist/play/${mySongs.MID}" type="application/octet-stream" />
                                        </c:otherwise>
                                    </c:choose>
                                    </audio></td>
                                    <td>Rs ${mySongs.price}</td>
                                    <td class="action-cell">
                                        <form action="/artist/edit/${mySongs.MID}" method="get" style="display:inline;">
                                            <button type="submit" class="btn-edit">
                                                <i class="fas fa-edit mr-1"></i> Edit
                                            </button>
                                        </form>
                                        <form action="/artist/delete/${mySongs.MID}" method="get" style="display:inline;">
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
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-music"></i>
                    <h3>No songs uploaded yet</h3>
                    <p>Start by uploading your first song to see it here.</p>
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
                    if (!confirm('Are you sure you want to delete this song?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>