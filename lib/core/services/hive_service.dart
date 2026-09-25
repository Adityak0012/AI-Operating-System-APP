import 'package:hive_flutter/hive_flutter.dart';
import '../models/schedule_item.dart';
import '../models/reminder_item.dart';
import '../models/habit_item.dart';
import '../models/task_item.dart';

class HiveService {
  static const String scheduleBox = 'scheduleBox';
  static const String remindersBox = 'remindersBox';
  static const String habitsBox = 'habitsBox';
  static const String tasksBox = 'tasksBox';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ScheduleItemAdapter());
    Hive.registerAdapter(ReminderItemAdapter());
    Hive.registerAdapter(HabitItemAdapter());
    Hive.registerAdapter(TaskItemAdapter());

    await Hive.openBox<ScheduleItem>(scheduleBox);
    await Hive.openBox<ReminderItem>(remindersBox);
    await Hive.openBox<HabitItem>(habitsBox);
    await Hive.openBox<TaskItem>(tasksBox);
  }

  // --- Schedule ---
  static Box<ScheduleItem> get _schedule => Hive.box<ScheduleItem>(scheduleBox);

  static Future<void> addSchedule(ScheduleItem item) => _schedule.add(item);
  static Future<void> deleteSchedule(int index) => _schedule.deleteAt(index);
  static List<ScheduleItem> getSchedules() => _schedule.values.toList();

  // --- Reminders ---
  static Box<ReminderItem> get _reminders => Hive.box<ReminderItem>(remindersBox);

  static Future<void> addReminder(ReminderItem item) => _reminders.add(item);
  static Future<void> deleteReminder(int index) => _reminders.deleteAt(index);
  static Future<void> toggleReminder(int index) async {
    final item = _reminders.getAt(index);
    if (item != null) {
      item.isCompleted = !item.isCompleted;
      await item.save();
    }
  }
  static List<ReminderItem> getReminders() => _reminders.values.toList();

  // --- Habits ---
  static Box<HabitItem> get _habits => Hive.box<HabitItem>(habitsBox);

  static Future<void> addHabit(HabitItem item) => _habits.add(item);
  static Future<void> deleteHabit(int index) => _habits.deleteAt(index);
  static Future<void> incrementHabit(int index) async {
    final item = _habits.getAt(index);
    if (item != null && item.progress < 7) {
      item.progress = item.progress + 1;
      await item.save();
    }
  }
  static List<HabitItem> getHabits() => _habits.values.toList();

  // --- Tasks ---
  static Box<TaskItem> get _tasks => Hive.box<TaskItem>(tasksBox);

  static Future<void> addTask(TaskItem item) => _tasks.add(item);
  static Future<void> deleteTask(int index) => _tasks.deleteAt(index);
  static Future<void> toggleTask(int index) async {
    final item = _tasks.getAt(index);
    if (item != null) {
      item.isCompleted = !item.isCompleted;
      await item.save();
    }
  }
  static List<TaskItem> getTasks() => _tasks.values.toList();
}
