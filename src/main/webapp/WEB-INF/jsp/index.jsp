<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Music Store - Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6b21a8 0%, #4c1d95 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .music-icon {
            display: inline-block;
            margin-right: 8px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .form-container:hover {
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

        .music-bg {
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path fill="rgba(139, 92, 246, 0.1)" d="M30,30 L30,70 L70,70 L70,30 Z M35,35 L65,35 L65,65 L35,65 Z M45,45 L55,45 L55,55 L45,55 Z"></path></svg>');
            background-size: 300px;
        }

        /* Password validation styles */
        .validation-error {
            color: #e53e3e;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: none;
        }

        .input-error {
            border-color: #e53e3e;
            box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
        }

        .password-strength {
            height: 5px;
            border-radius: 3px;
            margin-top: 5px;
            transition: all 0.3s ease;
        }

        .password-weak {
            background-color: #e53e3e;
            width: 33%;
        }

        .password-medium {
            background-color: #d69e2e;
            width: 66%;
        }

        .password-strong {
            background-color: #38a169;
            width: 100%;
        }

        .password-strength-text {
            font-size: 0.875rem;
            margin-top: 5px;
        }
    </style>
</head>
<body class="flex justify-center items-center py-8 px-4">
<div class="max-w-5xl w-full flex flex-col md:flex-row rounded-xl overflow-hidden">
    <!-- Left side with branding -->
    <div class="w-full md:w-2/5 bg-purple-900 text-white p-10 flex flex-col justify-center music-bg">
        <div class="mb-8">
            <h1 class="text-4xl font-bold mb-2 flex items-center">
                <span class="music-icon">🎵</span> Music Store
            </h1>
            <p class="text-purple-200">Join our community of music lovers and artists</p>
        </div>

        <div class="space-y-6 mt-8">
            <div class="flex items-center">
                <div class="bg-purple-700 rounded-full p-3 mr-4">
                    <span class="text-xl">🎸</span>
                </div>
                <p>Discover thousands of artists</p>
            </div>

            <div class="flex items-center">
                <div class="bg-purple-700 rounded-full p-3 mr-4">
                    <span class="text-xl">🎹</span>
                </div>
                <p>Create your personalized library</p>
            </div>

            <div class="flex items-center">
                <div class="bg-purple-700 rounded-full p-3 mr-4">
                    <span class="text-xl">🎧</span>
                </div>
                <p>Stream music in high quality</p>
            </div>
        </div>

        <div class="mt-12 text-purple-200 text-sm">
            <p>Already have an account? <a href="#" class="text-white font-medium underline">Sign in here</a></p>
        </div>
    </div>

    <!-- Right side with registration form -->
    <div class="w-full md:w-3/5 form-container p-8 md:p-12">
        <div class="mb-8 text-center">
            <h2 class="text-3xl font-bold text-purple-900">Create your account</h2>
            <p class="text-gray-600 mt-2">Join the Music Store community today</p>
        </div>

        <!-- Error message placed correctly inside the form container -->
        <c:if test="${not empty error}">
            <div class="mb-6 p-4 bg-red-100 text-red-700 rounded-lg border border-red-200 flex items-center">
                <i class="fas fa-exclamation-circle mr-2"></i>
                ${error}
            </div>
        </c:if>

        <form id="registrationForm" action="user/register" method="post" class="space-y-5">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                    <input type="text" name="firstname" placeholder="First Name" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
                </div>
                <div>
                    <input type="text" name="lastname" placeholder="Last Name" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
                </div>
            </div>

            <div>
                <input type="email" name="email" placeholder="E-mail address" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
            </div>

            <div>
                <select name="usertype" id="usertype" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus">
                    <option value="user">Music Listener</option>
                    <option value="artist">Artist</option>
                </select>
            </div>

            <div>
                <input type="password" name="password" id="password" placeholder="Password" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
                <div id="passwordError" class="validation-error">
                    <i class="fas fa-exclamation-circle mr-1"></i> Password must be at least 8 characters with uppercase, lowercase, number, and special character
                </div>
                <div id="passwordStrength" class="password-strength"></div>
                <div id="passwordStrengthText" class="password-strength-text"></div>
            </div>

            <div>
                <input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm Password" class="w-full bg-gray-50 text-gray-800 px-4 py-3.5 rounded-lg border border-gray-200 focus:outline-none purple-focus" required>
                <div id="confirmPasswordError" class="validation-error">
                    <i class="fas fa-exclamation-circle mr-1"></i> Passwords do not match
                </div>
            </div>

            <div class="flex items-center">
                <input type="checkbox" id="terms" class="w-4 h-4 text-purple-600 rounded focus:ring-purple-500" required>
                <label for="terms" class="ml-2 text-sm text-gray-600">I agree to the <a href="#" class="text-purple-700 font-medium">Terms and Conditions</a></label>
            </div>

            <button type="submit" class="w-full btn-purple text-white font-medium py-3.5 rounded-lg transition">Create Account</button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">Or sign up with</p>
            <div class="flex justify-center space-x-4 mt-3">
                <button class="p-2.5 border border-gray-200 rounded-full hover:bg-gray-50 transition">
                    <span class="sr-only">Google</span>
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-2.917 16.083c-2.258 0-4.083-1.825-4.083-4.083s1.825-4.083 4.083-4.083c1.103 0 2.024.402 2.735 1.067l-1.107 1.068c-.304-.292-.83-.634-1.628-.634-1.394 0-2.531 1.155-2.531 2.579 0 1.424 1.138 2.579 2.531 2.579 1.616 0 2.224-1.162 2.316-1.762h-2.316v-1.417h3.855c.036.204.064.408.064.68 0 2.244-1.5 3.812-3.919 3.812zm9.917-3.5h-1.5v-1.5h-1.5v1.5h-1.5v1.5h1.5v1.5h1.5v-1.5h1.5v-1.5z"/>
                    </svg>
                </button>
                <button class="p-2.5 border border-gray-200 rounded-full hover:bg-gray-50 transition">
                    <span class="sr-only">Facebook</span>
                    <svg class="w-5 h-5 text-blue-600" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm3 8h-1.35c-.538 0-.65.221-.65.778v1.222h2l-.209 2h-1.791v7h-3v-7h-2v-2h2v-2.308c0-1.3.35-2.692 2.65-2.692h2.35v3z"/>
                    </svg>
                </button>
                <button class="p-2.5 border border-gray-200 rounded-full hover:bg-gray-50 transition">
                    <span class="sr-only">Apple</span>
                    <svg class="w-5 h-5" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm0 22c-5.514 0-10-4.486-10-10s4.486-10 10-10 10 4.486 10 10-4.486 10-10 10zm-.896-13.849c-.432.999-.771 1.975-1.012 2.925-.165.649-.594.976-1.092.976-.315 0-.701-.15-1.157-.451-.455-.3-.875-.451-1.257-.451-.41 0-.834.151-1.27.451-.438.301-.808.451-1.113.451-.52 0-.964-.328-1.333-.984-.296-.522-.637-1.385-1.023-2.587-.389-1.204-.583-2.325-.583-3.368 0-1.073.314-1.937.943-2.591.629-.654 1.437-.981 2.425-.981 .44 0 1.01.151 1.708.451.699.301 1.146.451 1.342.451.147 0 .633-.176 1.458-.527.825-.352 1.516-.527 2.075-.527 1.156 0 2.061.345 2.716 1.036.655.691.982 1.702.982 3.036 0 .165-.011.397-.033.697-.023.3-.034.515-.034.645 0 .336.151.593.451.77.301.177.633.265.995.265.336 0 .687-.088 1.052-.265.366-.177.687-.265.963-.265.165 0 .432.088.802.265.37.177.629.433.775.77.352.799.607 1.699.765 2.699.157 1 .236 1.954.236 2.862 0 1.073-.166 2.126-.496 3.161-.331 1.035-.879 1.866-1.644 2.492-.766.627-1.621.94-2.565.94-.44 0-.975-.126-1.605-.377-.631-.252-1.156-.377-1.575-.377-.366 0-.808.125-1.327.377-.519.251-.998.377-1.438.377-.825 0-1.646-.3-2.463-.899-.816-.6-1.406-1.449-1.768-2.549z"/>
                    </svg>
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const registrationForm = document.getElementById('registrationForm');
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmpassword');
        const passwordError = document.getElementById('passwordError');
        const confirmPasswordError = document.getElementById('confirmPasswordError');
        const passwordStrength = document.getElementById('passwordStrength');
        const passwordStrengthText = document.getElementById('passwordStrengthText');

        // Password strength checker
        function checkPasswordStrength(password) {
            // Define strength criteria
            const hasUpperCase = /[A-Z]/.test(password);
            const hasLowerCase = /[a-z]/.test(password);
            const hasNumbers = /\d/.test(password);
            const hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);
            const isLongEnough = password.length >= 8;

            // Calculate strength score
            let strength = 0;
            if (hasUpperCase) strength++;
            if (hasLowerCase) strength++;
            if (hasNumbers) strength++;
            if (hasSpecialChar) strength++;
            if (isLongEnough) strength++;

            return strength;
        }

        // Update password strength indicator
        function updatePasswordStrength(password) {
            const strength = checkPasswordStrength(password);

            // Clear previous classes
            passwordStrength.className = 'password-strength';

            if (password.length === 0) {
                passwordStrength.style.display = 'none';
                passwordStrengthText.textContent = '';
                return;
            }

            passwordStrength.style.display = 'block';

            if (strength <= 2) {
                passwordStrength.classList.add('password-weak');
                passwordStrengthText.textContent = 'Weak password';
                passwordStrengthText.style.color = '#e53e3e';
            } else if (strength <= 4) {
                passwordStrength.classList.add('password-medium');
                passwordStrengthText.textContent = 'Medium strength password';
                passwordStrengthText.style.color = '#d69e2e';
            } else {
                passwordStrength.classList.add('password-strong');
                passwordStrengthText.textContent = 'Strong password';
                passwordStrengthText.style.color = '#38a169';
            }
        }

        // Validate password strength
        function isPasswordStrong(password) {
            return checkPasswordStrength(password) >= 4; // At least medium strength
        }

        // Event listener for password input
        passwordInput.addEventListener('input', function() {
            updatePasswordStrength(this.value);

            // Clear error when user starts typing
            if (passwordError.style.display === 'block') {
                passwordError.style.display = 'none';
                this.classList.remove('input-error');
            }

            // Check if confirm password matches
            if (confirmPasswordInput.value && this.value !== confirmPasswordInput.value) {
                confirmPasswordError.style.display = 'block';
                confirmPasswordInput.classList.add('input-error');
            } else {
                confirmPasswordError.style.display = 'none';
                confirmPasswordInput.classList.remove('input-error');
            }
        });

        // Event listener for confirm password input
        confirmPasswordInput.addEventListener('input', function() {
            if (this.value !== passwordInput.value) {
                confirmPasswordError.style.display = 'block';
                this.classList.add('input-error');
            } else {
                confirmPasswordError.style.display = 'none';
                this.classList.remove('input-error');
            }
        });

        // Form submission validation
        registrationForm.addEventListener('submit', function(event) {
            let isValid = true;

            // Check if password is strong enough
            if (!isPasswordStrong(passwordInput.value)) {
                passwordError.style.display = 'block';
                passwordInput.classList.add('input-error');
                isValid = false;
            }

            // Check if passwords match
            if (passwordInput.value !== confirmPasswordInput.value) {
                confirmPasswordError.style.display = 'block';
                confirmPasswordInput.classList.add('input-error');
                isValid = false;
            }

            // Prevent form submission if validation fails
            if (!isValid) {
                event.preventDefault();

                // Scroll to the first error
                const firstError = document.querySelector('.input-error');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        });
    });
</script>
</body>
</html>