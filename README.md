# Football Online

A real-time multiplayer football game application built with Flutter.

## Features

- 🎮 Real-time multiplayer matches
- 🏆 Ranking system with divisions
- 🏅 Tournaments
- 👥 Friend system and leagues
- 💬 In-game chat
- 📊 Statistics and achievements

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── user.dart
│   └── match.dart
├── screens/                  # App screens
│   └── home_screen.dart
├── services/                 # Business logic & API
├── widgets/                  # Reusable widgets
└── utils/                    # Utilities
```

## Getting Started

1. Install dependencies:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Development Status

🚧 **Under Development** - MVP in progress

### Completed
- ✅ Project setup
- ✅ Home screen UI
- ✅ Basic models (User, Match)

### In Progress
- 🔄 Authentication system
- 🔄 Matchmaking
- 🔄 Game match screen

### Planned
- ⏳ Real-time match synchronization
- ⏳ Ranking system
- ⏳ Tournaments
- ⏳ Social features

## Tech Stack

- **Framework**: Flutter 3.x+
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Real-time**: WebSockets
- **Backend**: TBD (Firebase or Node.js)

## License

Private project - All rights reserved
