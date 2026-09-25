import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/reminder_item.dart';
import '../services/hive_service.dart';

class RemindersNotifier extends StateNotifier<List<ReminderItem>> {
  RemindersNotifier() : super(HiveService.getReminders());

  void add(ReminderItem item) {
    HiveService.addReminder(item).then((_) {
      state = HiveService.getReminders();
    });
  }

  void delete(int index) {
    HiveService.deleteReminder(index).then((_) {
      state = HiveService.getReminders();
    });
  }

  void toggle(int index) {
    HiveService.toggleReminder(index).then((_) {
      state = HiveService.getReminders();
    });
  }

  void refresh() {
    state = HiveService.getReminders();
  }
}

final remindersProvider =
    StateNotifierProvider<RemindersNotifier, List<ReminderItem>>(
  (ref) => RemindersNotifier(),
);
