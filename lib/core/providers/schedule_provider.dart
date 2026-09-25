import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/schedule_item.dart';
import '../services/hive_service.dart';

class ScheduleNotifier extends StateNotifier<List<ScheduleItem>> {
  ScheduleNotifier() : super(HiveService.getSchedules());

  void add(ScheduleItem item) {
    HiveService.addSchedule(item).then((_) {
      state = HiveService.getSchedules();
    });
  }

  void delete(int index) {
    HiveService.deleteSchedule(index).then((_) {
      state = HiveService.getSchedules();
    });
  }

  void refresh() {
    state = HiveService.getSchedules();
  }
}

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, List<ScheduleItem>>(
  (ref) => ScheduleNotifier(),
);
