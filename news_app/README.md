# News App using Flutter (GetX, MVVM, HTTP & UI Animations)

## 🚀 Overview

This is a Flutter News App built using GetX for state management and MVVM architecture. It fetches news articles from the NewsAPI and displays them with animations.

## 🛠 Features

- 📰 Fetches news articles from NewsAPI using HTTP requests.
- 🔍 Search functionality to filter news articles.
- 🎭 Hero Animation for smooth transitions.
- ✨ Shimmer Effect while loading news.
- 🎨 Animated Bottom Navigation Bar.
- 🖐 Swipe to Dismiss articles with animation.
- 📱 Fully responsive and pixel-perfect UI.

---

## 📂 Project Structure

```
lib
│── models
│   ├── news_article.dart
│── views
│   ├── home_screen.dart
│   ├── news_detail_screen.dart
│── controllers
│   ├── news_controller.dart
│── services
│   ├── api_service.dart
│── bindings
│   ├── news_binding.dart
│── widgets
│   ├── shimmer_loader.dart  # (For loading animation)
│── main.dart
```

---

## 📥 Installation & Setup

### 1️⃣ Clone the Repository

```sh
git clone httpsgithub.comyour-usernameNewsApp.git
cd NewsApp
```

### 2️⃣ Install Dependencies

```sh
flutter pub get
```

### 3️⃣ Setup News API Key

1. Get a free API key from [NewsAPI](httpsnewsapi.org).
2. Open `` file.
3. Replace `YOUR_API_KEY` with your actual API key

```dart
const String apiKey = YOUR_API_KEY;
```

### 4️⃣ Run the App

```sh
flutter run
```
## SCREENSHOTS 
![Screenshot](https://github.com/user-attachments/assets/2c7d5c6c-7a47-4ae2-9ff9-511e062869c3)
![Screenshot 2](https://github.com/user-attachments/assets/1d7885e7-5674-48f5-a944-bf116f074a27)

