import 'package:hive_flutter/hive_flutter.dart';
import '../models/schedule_item.dart';
import '../models/reminder_item.dart';
import '../models/habit_item.dart';

class HiveService {
  static const String scheduleBox = 'scheduleBox';
  static const String remindersBox = 'remindersBox';
  static const String habitsBox = 'habitsBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ScheduleItemAdapter());
    Hive.registerAdapter(ReminderItemAdapter());
    Hive.registerAdapter(HabitItemAdapter());

    final schedule = await Hive.openBox<ScheduleItem>(scheduleBox);
    final reminders = await Hive.openBox<ReminderItem>(remindersBox);
    final habits = await Hive.openBox<HabitItem>(habitsBox);

    // Seed default data if boxes are empty
    if (schedule.isEmpty) {
      await schedule.addAll([
        ScheduleItem(title: 'Team Standup', time: '10:00 AM', colorValue: 0xFFFF9800),
        ScheduleItem(title: 'Design Review', time: '11:30 AM', colorValue: 0xFF2196F3),
        ScheduleItem(title: 'Lunch with Sarah', time: '1:00 PM', colorValue: 0xFF4CAF50),
      ]);
    }

    if (reminders.isEmpty) {
      await reminders.addAll([
        ReminderItem(title: 'Drink water', time: 'Every 2 hours'),
        ReminderItem(title: 'Reply to emails', time: '12:00 PM'),
        ReminderItem(title: 'Pay electricity bill', time: 'Before 5:00 PM'),
      ]);
    }

    if (habits.isEmpty) {
      await habits.addAll([
        HabitItem(name: 'Meditation', progress: 5),
        HabitItem(name: 'Reading', progress: 3),
        HabitItem(name: 'Workout', progress: 6),
      ]);
    }
  }
}
