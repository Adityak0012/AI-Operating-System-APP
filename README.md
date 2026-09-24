# AI Life OS

A personal AI-powered life management Flutter app that acts as your daily operating system — helping you manage your schedule, habits, expenses, reminders, and interact with an AI assistant.

---

## Tech Stack

- **Framework:** Flutter (Dart ^3.12.2)
- **State Management:** Flutter Riverpod
- **Navigation:** GoRouter (StatefulShellRoute with indexed stack)
- **Local Storage:** Hive + Hive Flutter
- **HTTP Client:** Dio
- **Charts:** fl_chart
- **Fonts:** Google Fonts

---

## Project Structure

ai_life_os/
├── assets/
│ └── images/ # App images (Robot_image.png, banner1.png)
├── lib/
│ ├── main.dart # App entry point with ProviderScope
│ ├── core/
│ │ ├── constants/ # App constants and route constants
│ │ ├── error/ # Exception and failure classes
│ │ ├── theme/ # AppColors, AppTextStyles, AppTheme
│ │ ├── usecase/ # Base UseCase abstraction
│ │ └── utils/ # DummyData, validators, extensions
│ └── presentation/
│ ├── layout/ # ScaffoldWithNavBar (bottom nav + FAB)
│ ├── routes/ # app_router.dart (GoRouter config)
│ └── screens/
│ ├── splash/ # Splash screen
│ ├── onboarding/ # Onboarding screen
│ ├── home/ # Home screen + 8 dashboard widgets
│ ├── planner/ # Planner screen + 5 widgets
│ ├── ai_assistant/ # AI Assistant screen
│ └── profile/ # Profile screen
├── android/ # Android platform files
├── ios/ # iOS platform files
├── web/ # Web platform files
├── linux/ # Linux platform files
├── macos/ # macOS platform files
├── windows/ # Windows platform files
├── pubspec.yaml
└── README.md


---

## Screens & Completion Status

### ✅ Completed

#### Home Screen
Full dashboard with the following widgets:
- **HomeHeader** — User greeting with name and top app bar
- **AiBriefingCard** — Daily AI-generated briefing card
- **DateStrip** — Horizontal scrollable date selector
- **ScheduleCard** — Today's schedule overview
- **RemindersCard** — Active reminders list
- **HabitCard** — Weekly habit tracker with progress
- **ExpenseCard** — Current month expense summary
- **QuickActionsRow** — Shortcut action buttons
- **MotivationCard** — Daily motivation quote

#### Planner Screen
Full planner view with the following widgets:
- **PlannerHeader** — Planner title and controls
- **PlannerDateStrip** — Date navigation strip
- **TabSelector** — Toggle between Schedule and Tasks tabs
- **ScheduleTimeline** — Detailed timeline of daily events
- **UpcomingTasks** — Task list with priority and category tags
- **OverviewStats** — Summary stats for the day/week

#### Navigation
- Bottom navigation bar with Home, Planner, AI Assistant, and Profile tabs
- Center FAB (gradient purple) that opens AI Assistant screen
- GoRouter with StatefulShellRoute for persistent tab state

#### Theme & Core
- AppColors, AppTheme (light + dark), AppTextStyles defined
- Route constants defined
- Error handling classes (exceptions, failures) scaffolded
- Base UseCase class defined
- DummyData utility with schedule, reminders, habits, expense, and planner data

---

### ⚠️ Remaining / Incomplete

#### AI Assistant Screen
- Currently a placeholder (`Center(child: Text('AI Assistant Screen'))`)
- Needs: Chat UI, message input, API integration (e.g. Claude / OpenAI via Dio), conversation history with Hive

#### Profile Screen
- Currently a placeholder
- Needs: User info display, settings, preferences, edit profile functionality

#### Splash Screen
- Currently a placeholder
- Needs: Animated logo, auto-navigation to onboarding or home based on first-launch check

#### Onboarding Screen
- Currently a placeholder
- Needs: Multi-step onboarding flow, user name input, preference setup, stored via Hive/SharedPreferences

#### Real Data & Backend Integration
- All data currently sourced from `DummyData` (hardcoded)
- Needs: Riverpod providers, repositories, use cases wired up
- Needs: Hive models for local persistence (schedule, habits, expenses)
- Needs: Dio API service for AI assistant calls

#### State Management Wiring
- Riverpod is installed but no providers are created yet
- Needs: Providers for home, planner, AI assistant, and profile screens

---

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

> Requires Flutter SDK with Dart ^3.12.2

---

## Platform Support

| Platform | Supported |
|----------|-----------|
| Android  | ✅ |
| iOS      | ✅ |
| Web      | ✅ |
| macOS    | ✅ |
| Windows  | ✅ |
| Linux    | ✅ |
