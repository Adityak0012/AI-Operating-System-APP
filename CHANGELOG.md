# AI Life OS — Changelog

> A personal AI-powered life management Flutter app that acts as your daily operating system — managing your schedule, habits, reminders, expenses, and AI assistant in one place.

---

## [v0.2.0] — 2026-09-25 · `fixing ui and some bugs`

### Data Layer — New Models & Local Storage

| File | Change |
|------|--------|
| `lib/core/models/habit_item.dart` + `.g.dart` | Added `HabitItem` model with Hive type adapters |
| `lib/core/models/reminder_item.dart` + `.g.dart` | Added `ReminderItem` model with Hive type adapters |
| `lib/core/models/schedule_item.dart` + `.g.dart` | Added `ScheduleItem` model with Hive type adapters |
| `lib/core/services/hive_service.dart` | New `HiveService` — initialises boxes and handles read/write for all three models |
| `lib/core/services/api_service.dart` | New `ApiService` using Dio — base HTTP client for AI/backend calls |

### State Management — Riverpod Providers

| File | Change |
|------|--------|
| `lib/core/providers/habits_provider.dart` | `HabitsProvider` — exposes habit list state |
| `lib/core/providers/reminders_provider.dart` | `RemindersProvider` — exposes reminders state |
| `lib/core/providers/schedule_provider.dart` | `ScheduleProvider` — exposes schedule state |
| `lib/core/providers/data_providers.dart` | Barrel file wiring all data providers together |

### Firebase Integration

| File | Change |
|------|--------|
| `lib/firebase_options.dart` | Auto-generated Firebase config (Android, iOS, macOS, Web) |
| `android/app/google-services.json` | Added Android Firebase credentials |
| `android/app/build.gradle.kts` | Added `google-services` plugin dependency |
| `android/settings.gradle.kts` | Registered Google services Gradle plugin |
| `firebase.json` | Firebase project config file |

### UI Fixes — Home Screen Widgets

| File | Change |
|------|--------|
| `lib/presentation/screens/home/widgets/habit_card.dart` | Wired to live `HabitsProvider`; fixed layout spacing |
| `lib/presentation/screens/home/widgets/reminders_card.dart` | Wired to live `RemindersProvider`; fixed overflow bug |
| `lib/presentation/screens/home/widgets/schedule_card.dart` | Wired to live `ScheduleProvider`; fixed layout spacing |
| `lib/presentation/screens/home/widgets/home_header.dart` | Updated greeting and avatar section styling |

### App Entry Point

| File | Change |
|------|--------|
| `lib/main.dart` | Initialised Firebase and Hive before `runApp`; registered Hive type adapters |

### Dependencies (`pubspec.yaml` / `pubspec.lock`)

```yaml
# Added
hive: ^2.x
hive_flutter: ^1.x
firebase_core: ^x.x
```

### Platform Support

| Platform | Change |
|----------|--------|
| macOS | `GeneratedPluginRegistrant.swift` updated for new plugins |
| Windows | `generated_plugin_registrant.cc` and `generated_plugins.cmake` updated |

---

## [v0.1.0] — Initial Commit · `85fb13a`

- Flutter project scaffold with Riverpod, GoRouter, Hive, Dio, fl_chart
- Core theme system (`AppColors`, `AppTextStyles`, `AppTheme`)
- Navigation layout (`ScaffoldWithNavBar`) with bottom nav + FAB
- Screens: Splash, Onboarding, Home dashboard, Planner, AI Assistant, Profile
- Home dashboard widgets: habit card, schedule card, reminders card, home header, and more
- Planner screen with 5 sub-widgets
- Dummy data utilities for development

---

## Tech Stack

| Layer | Library |
|-------|---------|
| Framework | Flutter (Dart ^3.12.2) |
| State Management | Flutter Riverpod |
| Navigation | GoRouter (StatefulShellRoute) |
| Local Storage | Hive + Hive Flutter |
| Backend | Firebase (Core) |
| HTTP Client | Dio |
| Charts | fl_chart |
| Fonts | Google Fonts |
