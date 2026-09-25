import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/habit_item.dart';
import '../services/hive_service.dart';

class HabitsNotifier extends StateNotifier<List<HabitItem>> {
  HabitsNotifier() : super(HiveService.getHabits());

  void add(HabitItem item) {
    HiveService.addHabit(item).then((_) {
      state = HiveService.getHabits();
    });
  }

  void delete(int index) {
    HiveService.deleteHabit(index).then((_) {
      state = HiveService.getHabits();
    });
  }

  void increment(int index) {
    HiveService.incrementHabit(index).then((_) {
      state = HiveService.getHabits();
    });
  }

  void refresh() {
    state = HiveService.getHabits();
  }
}

final habitsProvider = StateNotifierProvider<HabitsNotifier, List<HabitItem>>(
  (ref) => HabitsNotifier(),
);
