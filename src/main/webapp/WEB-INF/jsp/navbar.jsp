<nav class="bg-gray-900 text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <!-- Logo -->
            <div class="flex-shrink-0">
                <a href="/" class="text-2xl font-bold text-white hover:text-gray-300">Music Store</a>
            </div>
            <!-- Desktop Menu -->
            <div id="desktop-nav" class="hidden md:flex md:items-center space-x-8">
                <!-- All Bikes link (now has an id) -->
                <a id="allBikesLink" href="/bikes/bikeList" class="hover:text-gray-300">Home</a>
                <!-- Profile icon -->
                <div id="profileIcon" class="flex items-center space-x-2">
                    <a href="/users/profile" class="flex items-center justify-center w-10 h-10 rounded-full bg-gray-500 hover:bg-gray-400">
                        <img src="https://th.bing.com/th/id/OIP.e3qvNUpZQb8-Hc0vyTIIogAAAA?w=425&h=425&rs=1&pid=ImgDetMain"
                             alt="Profile"
                             class="w-full h-full object-cover rounded-full">
                    </a>
                </div>
            </div>
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

    const isLoggedIn             = getCookie('login') === 'true';
    const userRole               = getCookie('role');

    const desktopNav             = document.getElementById('desktop-nav');

    const logoutButton = `
    <button id="logoutBtn" class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded-md text-white">
      Logout
    </button>
  `;

    const loginButtons = `
    <a href="/login" class="bg-blue-500 hover:bg-blue-600 px-4 py-2 rounded-md text-white">Login</a>
    <a href="/" class="bg-green-500 hover:bg-green-600 px-4 py-2 rounded-md text-white">Register</a>
  `;

    const dashboardLink = `
    <a href="/admin" class="bg-yellow-500 hover:bg-yellow-600 px-4 py-2 rounded-md text-white">Dashboard</a>
  `;

    if (isLoggedIn) {
        // Admin dashboard link
        if (userRole === 'admin') {
            desktopNav.insertAdjacentHTML('beforeend', dashboardLink);
        }
        desktopNav.insertAdjacentHTML('beforeend', logoutButton);
    } else {
        // Not logged in: show login/register
        desktopNav.insertAdjacentHTML('beforeend', loginButtons);

        // Hide profile icons
        profileIcon.style.display       = 'none';
    }

    // Logout handler
    document.addEventListener('click', function (e) {
        if (e.target.id === 'logoutBtn') {
            document.cookie = "login=false; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            document.cookie = "role=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT";
            fetch('/users/logout', { method: 'GET', credentials: 'include' })
                .then(() => window.location.href = '/login?logout=true')
                .catch(() => window.location.href = '/login?logout=true');
        }
    });

</script>