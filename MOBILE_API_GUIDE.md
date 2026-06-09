# Mobile App API Guide

This document explains every backend API route that the **Palm Recognition Mobile App** uses to function. It is designed to help developers and users understand exactly how the app talks to the server, when it makes those calls, and what data it expects.

## Base URL
All requests are made to the base URL: `https://api.phoudthasone.com/api/v1`

---

## 1. Authentication (Logging In & Registering)
*These routes handle getting users into the app and keeping their session active.*


### `POST /auth/login`
* **What it does:** Authenticates an existing user and gives them access tokens.
* **When it's called:** When the user enters their phone number and password on the Login screen.
* **What it sends:** Phone number and password.
* **What it receives:** The user's basic profile details, an Access Token (short-lived, used for API calls), and a Refresh Token (long-lived, used to get new Access Tokens).

### `POST /auth/refresh`
* **What it does:** Silently gets a new Access Token so the user doesn't get logged out randomly.
* **When it's called:** Automatically in the background when the app detects that the current Access Token has expired (usually every 15 minutes).
* **What it sends:** The Refresh Token.
* **What it receives:** A fresh set of Access and Refresh tokens.

---

## 2. User Profile & Data
*These routes fetch or update data specifically belonging to the logged-in user. The app automatically attaches the Access Token to these requests.*

### `GET /me`
* **What it does:** Fetches the logged-in user's full profile details.
* **When it's called:** Right after logging in, or when opening the "Profile" / "Home" tab to display the user's name, employee ID, and department.
* **What it receives:** A JSON object containing the user's profile information.

### `PATCH /me/password`
* **What it does:** Updates the user's password securely.
* **When it's called:** When the user submits the "Change Password" form in the app's settings.
* **What it sends:** The `old_password` and the `new_password`.
* **What it receives:** A simple success confirmation.

### `GET /me/attendance`
* **What it does:** Fetches the user's personal daily check-in and check-out logs.
* **When it's called:** When the user navigates to the "History" or "Attendance" tab in the app.
* **What it sends:** Optional query parameters like `page` (for infinite scrolling) and `start_date`/`end_date` (for filtering).
* **What it receives:** A paginated list of attendance records showing the date, check-in time, check-out time, and status (e.g., Present, Late).

### `GET /me/palm-templates`
* **What it does:** Retrieves a list of biometric palm vectors that the user has already registered in the system.
* **When it's called:** When the user opens the "My Palms" or "Biometrics" section in the app settings to see if they are fully enrolled.
* **What it receives:** A list of enrolled palms (e.g., indicating "Left Hand", the date it was enrolled, and its active status).

---

## 3. Palm Pairing Flow
*These are the most critical routes for the mobile app! They handle the secure connection between the user's phone and the physical Raspberry Pi scanner during enrollment.*

### `POST /pairing/scan`
* **What it does:** Validates the QR code that the user just scanned from the hardware device's screen.
* **When it's called:** Immediately after the mobile app's camera reads a QR code.
* **What it sends:** The `session_token` extracted from the QR code.
* **What it receives:** Details about the scanner device (including its `device_name`, `device_code`, and `location_name`) so the app can ask the user: *"Do you want to pair with the Main Entrance Scanner at Front Door?"*

### `POST /pairing/approve`
* **What it does:** Officially authorizes the hardware scanner to read the user's palm and link it to their account. It specifies which hand is being enrolled.
* **When it's called:** When the user clicks the "Approve Pairing" button on their phone screen and selects which hand they want to enroll.
* **What it sends:** The `session_token` and `hand_side` (must be `"left"` or `"right"`).
* **What it receives:** A success confirmation. At this exact moment, the physical scanner is notified that it has permission to start scanning the user's hand!
