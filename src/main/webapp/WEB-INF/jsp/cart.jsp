<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>My Cart - Music Store</title>
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

        .cart-container {
            max-width: 1200px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 30px;
            transition: all 0.3s ease;
        }

        .cart-container:hover {
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

        .cart-items {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-bottom: 2rem;
        }

        .cart-item {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            width: 100%;
        }

        .cart-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
        }

        .item-details {
            flex: 1;
            padding: 20px;
        }

        .item-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #6b21a8;
            margin-bottom: 10px;
        }

        .item-info {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .info-row {
            display: flex;
        }

        .info-label {
            font-weight: 600;
            color: #4a5568;
            min-width: 80px;
        }

        .info-value {
            color: #718096;
        }

        .item-actions {
            padding: 20px;
            display: flex;
            align-items: center;
        }

        .delete-btn {
            background: none;
            border: none;
            color: #e53e3e;
            font-size: 1.5rem;
            cursor: pointer;
            transition: all 0.3s;
            padding: 10px;
            border-radius: 50%;
        }

        .delete-btn:hover {
            background-color: #fed7d7;
            transform: scale(1.1);
        }

        .cart-summary {
            background: #f8fafc;
            padding: 25px;
            border-radius: 12px;
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .total-price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .total-label {
            font-size: 1.5rem;
            font-weight: 600;
            color: #4a5568;
        }

        .total-value {
            font-size: 1.8rem;
            font-weight: 700;
            color: #7c3aed;
        }

        .buy-btn {
            width: 100%;
            background: #38a169;
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .buy-btn:hover {
            background: #2f855a;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(56, 161, 105, 0.3);
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: #718096;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: #a0aec0;
        }

        .empty-state h3 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            color: #4a5568;
        }

        .empty-state p {
            font-size: 1.1rem;
        }

        @media (max-width: 767px) {
            .cart-item {
                flex-direction: column;
            }

            .item-actions {
                width: 100%;
                justify-content: center;
                border-top: 1px solid #e2e8f0;
            }

            .total-price {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <div class="header">
            <h1><i class="fas fa-shopping-cart mr-2"></i>My Cart</h1>
            <p>Review your selected songs</p>
        </div>

        <c:choose>
            <c:when test="${not empty mySongs}">
                <div class="cart-items">
                    <c:forEach var="song" items="${mySongs}">
                        <div class="cart-item">
                            <div class="item-details">
                                <div class="item-title">${song.name}</div>
                                <div class="item-info">
                                    <div class="info-row">
                                        <span class="info-label">Artist:</span>
                                        <span class="info-value">${song.artist}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Band:</span>
                                        <span class="info-value">
                                            <c:choose>
                                                <c:when test="${not empty song.band}">${song.band}</c:when>
                                                <c:otherwise>—</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="item-actions">
                                <form action="/cart/delete/${song.MID}" method="get" style="display:inline;">
                                    <button type="submit" class="delete-btn" title="Remove from cart">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="cart-summary">
                    <div class="total-price">
                        <span class="total-label">Total Price:</span>
                        <span class="total-value">$${price}</span>
                    </div>
                    <form action="/cart/buy/${price}" method="get" style="display:inline; width:100%;">
                        <button type="submit" class="buy-btn">
                            <i class="fas fa-credit-card mr-2"></i> Buy All
                        </button>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Your cart is empty</h3>
                    <p>Add songs to your cart to see them here.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>