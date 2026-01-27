Foodly 
Smart Meal Planning & Recipe Discovery App

Foodly is a comprehensive mobile application built with Flutter and Firebase. It’s designed to bridge the gap between finding a recipe and actually getting it on the table. With a clean, modern UI and real-time backend synchronization, Foodly makes healthy eating organized and accessible.

Key Features
Smart Discovery: Browse high-quality recipes with detailed prep times and difficulty levels.
Meal Calendar: Schedule your Breakfast, Lunch, and Dinner using an interactive calendar view.
Real-time Auth: Secure user registration and login powered by Firebase.
Dynamic Data: All user plans and recipes are stored in Cloud Firestore for instant access across devices.
Shopping Lists: Automatically tracks what you need for your planned meals.

Technical Stack
Frontend: Flutter (Dart)
Backend: Firebase (Authentication & Cloud Firestore)
Design: Google Fonts (Poppins), Cupertino Design System
Logic: Custom state management for handling meal data and user sessions.

Project Structure
lib/
 ├── core/           App themes and constants
 ├── models/         Data structures for Recipes & Users
 ├── screens/        UI screens (Sign In, Discovery, Profile, etc.)
 ├── services/       Firebase Auth & Firestore logic
 └── widgets/        Reusable UI components
