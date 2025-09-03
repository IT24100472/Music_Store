<%
    // Retrieve all cookies from the request
    Cookie[] cookies = request.getCookies();
    boolean isLoggedIn = false;

    // Loop through the cookies and check for the 'login' cookie with value 'true'
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("login".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                // If the login cookie exists and is set to 'true', the user is logged in
                isLoggedIn = true;
                break;
            }
        }
    }

    // If not logged in, redirect to the login page
    if (!isLoggedIn) {
        response.sendRedirect("/login");
        return; // Stop further processing of the page
    }
%>
