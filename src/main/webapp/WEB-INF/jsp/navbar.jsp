<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Store - Fixed Top Navigation</title>
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
            background: #f8fafc;
            padding-top: 64px; /* Account for fixed navbar height */
        }

        .nav-container {
            background: linear-gradient(135deg, #6b21a8 0%, #4c1d95 100%);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            padding: 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .nav-content {
            max-width: 100%;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .music-icon {
            display: inline-block;
            margin-right: 8px;
        }

        /* Animation for mobile menu */
        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .mobile-menu {
            animation: slideDown 0.3s ease-out;
        }

        .preview-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body>
<!-- Fixed Top Navigation Bar -->
<nav class="nav-container text-white w-full">
    <div class="nav-content">
        <div class="flex items-center justify-between h-16">
            <!-- Logo with music icon -->
            <div class="flex-shrink-0 flex items-center">
                <span class="text-3xl mr-3">🎵</span>
                <a href="/" class="text-2xl md:text-3xl font-bold text-white hover:text-purple-300 transition-colors">Music Store</a>
            </div>

            <!-- Desktop Menu -->
            <div class="hidden md:flex md:items-center space-x-6">
                <!-- Home link -->
                <a id="homeButton" href="/" class="px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 transition-colors">Home</a>

                <!-- Contact us link -->
                <a id="contactUs" href="/contact" class="px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 transition-colors">Contact Us</a>
                <!-- Profile icon -->
                <div class="flex items-center ml-4">
                    <a href="/user/profile" class="flex items-center justify-center w-12 h-12 rounded-full bg-purple-600 hover:bg-purple-500 transition-colors">
                        <img src="https://th.bing.com/th/id/OIP.e3qvNUpZQb8-Hc0vyTIIogAAAA?w=425&h=425&rs=1&pid=ImgDetMain"
                             alt="Profile"
                             class="w-full h-full object-cover rounded-full">
                    </a>
                </div>

                <!-- Auth buttons (will be populated by JS) -->
                <div id="desktop-auth-buttons" class="flex space-x-4"></div>
            </div>

            <!-- Mobile menu button -->
            <div class="md:hidden flex items-center">
                <button id="mobile-menu-button" class="text-white focus:outline-none p-2">
                    <svg class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <!-- Mobile Menu (hidden by default) -->
    <div id="mobile-menu" class="md:hidden hidden mobile-menu bg-purple-800 px-4 pt-3 pb-5 space-y-3">
        <a href="/" class="block px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 bg-purple-900">
            <i class="fas fa-home mr-3"></i>Home
        </a>
        <a href="/browse" class="block px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 bg-purple-900">
            <i class="fas fa-compass mr-3"></i>Browse
        </a>
        <div id="mobile-auth-buttons" class="pt-3 border-t border-purple-700 space-y-3">
            <!-- Mobile buttons will be inserted here by JavaScript -->
        </div>
    </div>
</nav>

<script>
    function getCookie(name) {
        let cookieArr = document.cookie.split(';');
        for (let i = 0; i < cookieArr.length; i++) {
            let cookie = cookieArr[i].trim();
            if (cookie.startsWith(name + '=')) {
                return cookie.substring(name.length + 1);
            }
        }
        return null;
    }

    const isLoggedIn = getCookie('login') === 'true';
    const userRole = getCookie('role');

    const desktopAuthButtons = document.getElementById('desktop-auth-buttons');
    const mobileAuthButtons = document.getElementById('mobile-auth-buttons');
    const profileIcon = document.querySelector('.flex.items-center.ml-4');
    const homeButton = document.getElementById('homeButton');
    const contactButton = document.getElementById('contactUs');

    const logoutButton = `
        <button id="logoutBtn" class="bg-purple-700 hover:bg-purple-600 px-5 py-2.5 rounded-md text-white font-medium transition-colors">
            Logout
        </button>
    `;

    const mobileLogoutButton = `
        <button id="mobileLogoutBtn" class="block w-full text-left px-4 py-3 rounded-md text-lg font-medium bg-purple-900 hover:bg-purple-700 text-white">
            <i class="fas fa-sign-out-alt mr-3"></i>Logout
        </button>
    `;

    const loginButtons = `
        <a href="/login" class="bg-purple-600 hover:bg-purple-500 px-5 py-2.5 rounded-md text-white font-medium transition-colors">Login</a>
        <a href="/register" class="bg-purple-500 hover:bg-purple-400 px-5 py-2.5 rounded-md text-white font-medium transition-colors">Register</a>
    `;

    const artistButton = `
        <a href="/artist" class="bg-blue-600 hover:bg-blue-500 px-5 py-2.5 rounded-md text-white font-medium transition-colors">Artist Portal</a>
    `;

    const browseButton = `
        <a href="/" class="px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 transition-colors">Browse</a>
    `;

    const songsButton = `
        <a href="/songs" class="px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 transition-colors">My Songs</a>
    `;

    const aSongsButton = `
        <a href="/songs" class="px-4 py-3 rounded-md text-lg font-medium hover:bg-purple-700 transition-colors">My Songs</a>
    `;

    const mobileLoginButtons = `
        <a href="/login" class="block px-4 py-3 rounded-md text-lg font-medium bg-purple-600 hover:bg-purple-500 text-white">
            <i class="fas fa-sign-in-alt mr-3"></i>Login
        </a>
        <a href="/" class="block px-4 py-3 rounded-md text-lg font-medium bg-purple-500 hover:bg-purple-400 text-white">
            <i class="fas fa-user-plus mr-3"></i>Register
        </a>
    `;

    const dashboardLink = `
        <a href="/admin" class="bg-purple-700 hover:bg-purple-600 px-5 py-2.5 rounded-md text-white font-medium transition-colors">
            <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
        </a>
    `;

    const mobileDashboardLink = `
        <a href="/admin" class="block px-4 py-3 rounded-md text-lg font-medium bg-purple-700 hover:bg-purple-600 text-white">
            <i class="fas fa-tachometer-alt mr-3"></i>Dashboard
        </a>
    `;

    // Desktop view
    if (isLoggedIn) {
        // Admin dashboard link
        if (userRole === 'admin') {
            desktopAuthButtons.insertAdjacentHTML('beforeend', dashboardLink);
        }
        if (userRole === 'user') {
            homeButton.insertAdjacentHTML('afterend', browseButton);
            contactButton.insertAdjacentHTML('beforebegin', songsButton);
        }
        if (userRole === 'artist') {
            contactButton.insertAdjacentHTML('afterend', artistButton);
            contactButton.insertAdjacentHTML('beforebegin', aSongsButton);
        }



        desktopAuthButtons.insertAdjacentHTML('beforeend', logoutButton);
    } else {
        // Not logged in: show login/register
        desktopAuthButtons.insertAdjacentHTML('beforeend', loginButtons);

        // Hide profile icons
        if (profileIcon) profileIcon.style.display = 'none';
    }

    // Mobile view
    if (isLoggedIn) {
        // Admin dashboard link
        if (userRole === 'admin') {
            mobileAuthButtons.insertAdjacentHTML('beforeend', mobileDashboardLink);
        }
        mobileAuthButtons.insertAdjacentHTML('beforeend', mobileLogoutButton);
    } else {
        mobileAuthButtons.insertAdjacentHTML('beforeend', mobileLoginButtons);
    }

    // Mobile menu toggle
    document.getElementById('mobile-menu-button').addEventListener('click', function() {
        const mobileMenu = document.getElementById('mobile-menu');
        mobileMenu.classList.toggle('hidden');
    });

    // Logout handler
    document.addEventListener('click', function (e) {
        if (e.target.id === 'logoutBtn' || e.target.id === 'mobileLogoutBtn') {
            document.cookie = "login=false; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            document.cookie = "role=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            fetch('/users/logout', { method: 'GET', credentials: 'include' })
                .then(() => window.location.href = '/login?logout=true')
                .catch(() => window.location.href = '/login?logout=true');
        }
    });
</script>
</body>
</html>