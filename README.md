# Gympact - iOS Final Project (Group 21)

### Group Members
- **Comus Hardman** – [hardman.c@northeastern.edu](mailto:hardman.c@northeastern.edu)
- **Derek Zhang** – [zhang.derek@northeastern.edu](mailto:zhang.derek@northeastern.edu)
- **Nicholas Payson** – [payson.n@northeastern.edu](mailto:payson.n@northeastern.edu)
- **Nikhil Gupta** – [gupta.nikh@northeastern.edu](mailto:gupta.nikh@northeastern.edu)

## Overview

**Gympact** is a fitness-tracking app designed to help users track their workouts and physical activities seamlessly. Unlike other apps, Gympact offers a simple and distraction-free interface targeted toward casual gym-goers who want an effective tool without the burden of subscription-based paywalls.

### App Features

- **User Authentication**: Secure login and signup functionality using Firebase.
- **Workout Tracking**: Log and track daily workouts efficiently with minimal distractions.
- **Progress Photos**: Use the camera sensor to take post-workout photos and attach them to workout logs for visual progress tracking.
- **Workout Timer**: Built-in countdown timer for rest periods between sets.
- **User Profile**: Manage and edit profile details easily.
- **Session Summary**: View a detailed summary of completed workouts and overall progress.

## Target Audience

Our app is aimed at **casual gym enthusiasts** who are looking for a straightforward, easy-to-use fitness app that prioritizes functionality over excessive features and costly subscriptions.

## App Flow

1. **Landing Page**: Users can choose to **Log In** or **Sign Up**.
2. **Authentication Pages**:
   - **Login Page**: Users enter their credentials and tap **Sign In** to proceed to the Main View.
   - **Sign Up Page**: New users can create an account and then access the Main View.
3. **Main View**: Central hub where users can:
   - View and add new workouts.
   - Access the **Profile** and **Workout Summary** pages.
4. **Add New Workout View**:
   - Users can input workout details and add a new session.
   - Countdown timers ensure rest periods are well-managed.
5. **Profile View**: Users can edit their profile information or return to the Main View.
6. **Workout Summary**: Review completed workouts and see progress. Users can mark workouts as done or navigate back to the Main View.

## Backend and Sensors

- **Firebase**: 
  - **Authentication**: Secure user login and signup.
  - **Realtime Database**: Efficiently store and retrieve user workout data.
- **Camera Sensor**: Users can capture and attach post-workout photos to track progress visually.
