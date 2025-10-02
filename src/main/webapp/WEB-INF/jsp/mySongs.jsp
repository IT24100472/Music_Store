<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Purchased Songs - Music Store</title>
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

        .purchased-container {
            max-width: 1200px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .purchased-container:hover {
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

        .songs-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .song-tile {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 4px solid #7c3aed;
        }

        .song-tile:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .song-content {
            display: flex;
            align-items: center;
            padding: 20px;
        }

        .song-info {
            flex: 1;
            padding-right: 20px;
        }

        .song-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 8px;
        }

        .song-details {
            display: flex;
            gap: 20px;
            margin-bottom: 10px;
        }

        .song-detail {
            display: flex;
            flex-direction: column;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #718096;
            font-weight: 500;
            margin-bottom: 4px;
        }

        .detail-value {
            font-size: 1rem;
            color: #4a5568;
            font-weight: 600;
        }

        .audio-player-container {
            flex: 1;
            max-width: 400px;
        }

        .audio-player {
            width: 100%;
            height: 50px;
            border-radius: 25px;
            background: #f7fafc;
            border: 1px solid #e2e8f0;
        }

        .empty-state {
            text-align: center;
            padding: 60px 40px;
            color: #718096;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            color: #a0aec0;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #4a5568;
        }

        .empty-state p {
            font-size: 1.1rem;
            max-width: 500px;
            margin: 0 auto;
        }

        .browse-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #7c3aed;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .browse-link:hover {
            background: #6d28d9;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .song-content {
                flex-direction: column;
                text-align: center;
            }

            .song-info {
                padding-right: 0;
                margin-bottom: 20px;
            }

            .song-details {
                justify-content: center;
            }

            .audio-player-container {
                max-width: 100%;
            }
        }

        @media (max-width: 480px) {
            .song-details {
                flex-direction: column;
                gap: 10px;
            }

            .song-title {
                font-size: 1.2rem;
            }
        }

        /* Custom audio player styling */
        audio::-webkit-media-controls-panel {
            background-color: #f7fafc;
            border-radius: 25px;
        }

        audio::-webkit-media-controls-play-button {
            background-color: #7c3aed;
            border-radius: 50%;
        }

        audio::-webkit-media-controls-current-time-display,
        audio::-webkit-media-controls-time-remaining-display {
            color: #4a5568;
            font-weight: 500;
        }
    </style>
</head>
<body>
 <c:if test="${not empty success}">
        <div class="mb-6 p-4 bg-purple-100 text-purple-700 rounded-lg border border-purple-200 flex items-center">
            <i class="fas fa-exclamation-circle mr-2"></i>
                ${success}
        </div>
    </c:if>
    <div class="purchased-container">
        <div class="header">
            <h1><i class="fas fa-music mr-2"></i>Purchased Songs</h1>
            <p>Your music library</p>
        </div>

        <c:choose>
            <c:when test="${not empty mySongs}">
                <div class="songs-list">
                    <c:forEach var="song" items="${mySongs}">
                        <div class="song-tile">
                            <div class="song-content">
                                <div class="song-info">
                                    <div class="song-title">${song.name}</div>
                                    <div class="song-details">
                                        <div class="song-detail">
                                            <span class="detail-label">Artist</span>
                                            <span class="detail-value">${song.artist}</span>
                                        </div>
                                        <c:if test="${not empty song.band}">
                                            <div class="song-detail">
                                                <span class="detail-label">Band</span>
                                                <span class="detail-value">${song.band}</span>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="audio-player-container">
                                    <audio controls class="audio-player">
                                        <c:choose>
                                            <c:when test="${song.fileType eq 'mp3'}">
                                                <source src="/artist/play/${song.MID}" type="audio/mpeg" />
                                            </c:when>
                                            <c:when test="${song.fileType eq 'wav'}">
                                                <source src="/artist/play/${song.MID}" type="audio/wav" />
                                            </c:when>
                                            <c:when test="${song.fileType eq 'ogg'}">
                                                <source src="/artist/play/${song.MID}" type="audio/ogg" />
                                            </c:when>
                                            <c:otherwise>
                                                <source src="/artist/play/${song.MID}" type="application/octet-stream" />
                                            </c:otherwise>
                                        </c:choose>
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-music"></i>
                    <h3>You haven't bought any songs yet</h3>
                    <p>Browse and purchase songs from our collection to build your music library</p>
                    <a href="/browse" class="browse-link">
                        <i class="fas fa-compass mr-2"></i>Browse Songs
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>