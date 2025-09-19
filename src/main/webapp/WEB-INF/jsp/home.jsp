<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp"%>
<html>
<head>
    <title>Music Store - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom, #faf5ff, #f3e8ff);
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .hero-section {
            background: linear-gradient(rgba(107, 33, 168, 0.8), rgba(76, 29, 149, 0.9)), url('https://images.unsplash.com/photo-1511379938547-c1f69419868d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
        }

        .album-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .album-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(107, 33, 168, 0.2);
        }

        .purple-gradient {
            background: linear-gradient(135deg, #6b21a8 0%, #4c1d95 100%);
        }

        .purple-gradient-reverse {
            background: linear-gradient(135deg, #4c1d95 0%, #6b21a8 100%);
        }

        .category-icon {
            background: rgba(139, 92, 246, 0.1);
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
        }

        .play-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .album-image-container:hover .play-button {
            opacity: 1;
        }
    </style>
</head>
<body>
<!-- Hero Section -->
<section class="hero-section text-white py-20 px-4 md:px-8">
    <div class="max-w-6xl mx-auto text-center">
        <h1 class="text-4xl md:text-6xl font-bold mb-6">Discover Your Sound</h1>
        <p class="text-xl md:text-2xl mb-10 max-w-3xl mx-auto">Explore millions of songs, albums, and artists. Curate your perfect music collection.</p>
        <div class="flex flex-col sm:flex-row justify-center gap-4">
            <button class="bg-white text-purple-800 font-bold py-3 px-8 rounded-full text-lg hover:bg-purple-100 transition-colors">
                Start Listening
            </button>
            <button class="bg-transparent border-2 border-white text-white font-bold py-3 px-8 rounded-full text-lg hover:bg-white hover:text-purple-800 transition-colors">
                Join Now
            </button>
        </div>
    </div>
</section>

<!-- Featured Albums -->
<section class="py-16 px-4 md:px-8">
    <div class="max-w-6xl mx-auto">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-purple-900 mb-12">Featured Albums</h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
            <!-- Album 1 -->
            <div class="album-card bg-white rounded-xl overflow-hidden shadow-lg">
                <div class="album-image-container relative">
                    <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Album cover" class="w-full h-48 object-cover">
                    <div class="play-button">
                        <div class="bg-purple-700 rounded-full p-3 cursor-pointer">
                            <i class="fas fa-play text-white text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-lg text-purple-900">Midnight Melodies</h3>
                    <p class="text-gray-600">Ethan Davis</p>
                    <div class="flex justify-between items-center mt-3">
                        <span class="text-purple-700 font-bold">$9.99</span>
                        <button class="bg-purple-600 text-white px-3 py-1 rounded-md text-sm hover:bg-purple-700 transition-colors">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <!-- Album 2 -->
            <div class="album-card bg-white rounded-xl overflow-hidden shadow-lg">
                <div class="album-image-container relative">
                    <img src="https://images.unsplash.com/photo-1571330735066-03aaa9429d89?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Album cover" class="w-full h-48 object-cover">
                    <div class="play-button">
                        <div class="bg-purple-700 rounded-full p-3 cursor-pointer">
                            <i class="fas fa-play text-white text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-lg text-purple-900">Electric Dreams</h3>
                    <p class="text-gray-600">Sophia Martinez</p>
                    <div class="flex justify-between items-center mt-3">
                        <span class="text-purple-700 font-bold">$12.99</span>
                        <button class="bg-purple-600 text-white px-3 py-1 rounded-md text-sm hover:bg-purple-700 transition-colors">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <!-- Album 3 -->
            <div class="album-card bg-white rounded-xl overflow-hidden shadow-lg">
                <div class="album-image-container relative">
                    <img src="https://images.unsplash.com/photo-1511735111819-9a3f7709049c?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Album cover" class="w-full h-48 object-cover">
                    <div class="play-button">
                        <div class="bg-purple-700 rounded-full p-3 cursor-pointer">
                            <i class="fas fa-play text-white text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-lg text-purple-900">Acoustic Sessions</h3>
                    <p class="text-gray-600">Noah Williams</p>
                    <div class="flex justify-between items-center mt-3">
                        <span class="text-purple-700 font-bold">$8.99</span>
                        <button class="bg-purple-600 text-white px-3 py-1 rounded-md text-sm hover:bg-purple-700 transition-colors">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>

            <!-- Album 4 -->
            <div class="album-card bg-white rounded-xl overflow-hidden shadow-lg">
                <div class="album-image-container relative">
                    <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Album cover" class="w-full h-48 object-cover">
                    <div class="play-button">
                        <div class="bg-purple-700 rounded-full p-3 cursor-pointer">
                            <i class="fas fa-play text-white text-xl"></i>
                        </div>
                    </div>
                </div>
                <div class="p-4">
                    <h3 class="font-bold text-lg text-purple-900">Urban Rhythms</h3>
                    <p class="text-gray-600">Ava Johnson</p>
                    <div class="flex justify-between items-center mt-3">
                        <span class="text-purple-700 font-bold">$11.99</span>
                        <button class="bg-purple-600 text-white px-3 py-1 rounded-md text-sm hover:bg-purple-700 transition-colors">
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-12">
            <button class="purple-gradient text-white font-bold py-3 px-8 rounded-full text-lg hover:opacity-90 transition-opacity">
                View All Albums
            </button>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-16 px-4 md:px-8 bg-purple-50">
    <div class="max-w-6xl mx-auto">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-purple-900 mb-12">Browse Categories</h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center p-6 bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow">
                <div class="category-icon text-purple-700 mb-4">
                    <i class="fas fa-music text-2xl"></i>
                </div>
                <h3 class="font-bold text-lg text-purple-900 mb-2">Pop</h3>
                <p class="text-gray-600">Catchy tunes and popular hits</p>
            </div>

            <div class="text-center p-6 bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow">
                <div class="category-icon text-purple-700 mb-4">
                    <i class="fas fa-guitar text-2xl"></i>
                </div>
                <h3 class="font-bold text-lg text-purple-900 mb-2">Rock</h3>
                <p class="text-gray-600">Classic and alternative rock</p>
            </div>

            <div class="text-center p-6 bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow">
                <div class="category-icon text-purple-700 mb-4">
                    <i class="fas fa-headphones text-2xl"></i>
                </div>
                <h3 class="font-bold text-lg text-purple-900 mb-2">Electronic</h3>
                <p class="text-gray-600">Beats and synth sounds</p>
            </div>

            <div class="text-center p-6 bg-white rounded-xl shadow-md hover:shadow-lg transition-shadow">
                <div class="category-icon text-purple-700 mb-4">
                    <i class="fas fa-drum text-2xl"></i>
                </div>
                <h3 class="font-bold text-lg text-purple-900 mb-2">Hip Hop</h3>
                <p class="text-gray-600">Urban beats and rhymes</p>
            </div>
        </div>
    </div>
</section>

<!-- Special Offer -->
<section class="py-16 px-4 md:px-8 purple-gradient text-white">
    <div class="max-w-6xl mx-auto text-center">
        <h2 class="text-3xl md:text-4xl font-bold mb-6">Special Limited Time Offer</h2>
        <p class="text-xl mb-8 max-w-3xl mx-auto">Get 3 months of premium streaming for the price of 1. Unlimited access to millions of songs.</p>

        <div class="flex items-center justify-center mb-10">
            <div class="bg-white text-purple-900 py-2 px-6 rounded-lg mr-4">
                <span class="text-3xl font-bold">05</span>
                <p>Days</p>
            </div>
            <div class="bg-white text-purple-900 py-2 px-6 rounded-lg mr-4">
                <span class="text-3xl font-bold">18</span>
                <p>Hours</p>
            </div>
            <div class="bg-white text-purple-900 py-2 px-6 rounded-lg mr-4">
                <span class="text-3xl font-bold">42</span>
                <p>Minutes</p>
            </div>
            <div class="bg-white text-purple-900 py-2 px-6 rounded-lg">
                <span class="text-3xl font-bold">19</span>
                <p>Seconds</p>
            </div>
        </div>

        <button class="bg-white text-purple-800 font-bold py-3 px-8 rounded-full text-lg hover:bg-purple-100 transition-colors">
            Get This Offer
        </button>
    </div>
</section>

<!-- Popular Artists -->
<section class="py-16 px-4 md:px-8">
    <div class="max-w-6xl mx-auto">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-purple-900 mb-12">Popular Artists</h2>

        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center">
                <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-purple-200 mb-4">
                    <img src="https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Artist" class="w-full h-full object-cover">
                </div>
                <h3 class="font-bold text-lg text-purple-900">Taylor Swift</h3>
                <p class="text-gray-600">Pop Artist</p>
            </div>

            <div class="text-center">
                <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-purple-200 mb-4">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Artist" class="w-full h-full object-cover">
                </div>
                <h3 class="font-bold text-lg text-purple-900">Adele</h3>
                <p class="text-gray-600">Soul Artist</p>
            </div>

            <div class="text-center">
                <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-purple-200 mb-4">
                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Artist" class="w-full h-full object-cover">
                </div>
                <h3 class="font-bold text-lg text-purple-900">Ed Sheeran</h3>
                <p class="text-gray-600">Folk Pop Artist</p>
            </div>

            <div class="text-center">
                <div class="w-32 h-32 mx-auto rounded-full overflow-hidden border-4 border-purple-200 mb-4">
                    <img src="https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80"
                         alt="Artist" class="w-full h-full object-cover">
                </div>
                <h3 class="font-bold text-lg text-purple-900">Beyoncé</h3>
                <p class="text-gray-600">R&B Artist</p>
            </div>
        </div>
    </div>
</section>

<script>
    // Simple countdown timer
    function updateCountdown() {
        const days = document.querySelector('.bg-white:nth-child(1) span');
        const hours = document.querySelector('.bg-white:nth-child(2) span');
        const minutes = document.querySelector('.bg-white:nth-child(3) span');
        const seconds = document.querySelector('.bg-white:nth-child(4) span');

        let timeLeft = {
            days: parseInt(days.textContent),
            hours: parseInt(hours.textContent),
            minutes: parseInt(minutes.textContent),
            seconds: parseInt(seconds.textContent)
        };

        const timer = setInterval(() => {
            if (timeLeft.seconds > 0) {
                timeLeft.seconds--;
            } else {
                timeLeft.seconds = 59;
                if (timeLeft.minutes > 0) {
                    timeLeft.minutes--;
                } else {
                    timeLeft.minutes = 59;
                    if (timeLeft.hours > 0) {
                        timeLeft.hours--;
                    } else {
                        timeLeft.hours = 23;
                        if (timeLeft.days > 0) {
                            timeLeft.days--;
                        } else {
                            clearInterval(timer);
                        }
                    }
                }
            }

            days.textContent = timeLeft.days.toString().padStart(2, '0');
            hours.textContent = timeLeft.hours.toString().padStart(2, '0');
            minutes.textContent = timeLeft.minutes.toString().padStart(2, '0');
            seconds.textContent = timeLeft.seconds.toString().padStart(2, '0');
        }, 1000);
    }

    // Start the countdown when page loads
    document.addEventListener('DOMContentLoaded', updateCountdown);
</script>
</body>
</html>