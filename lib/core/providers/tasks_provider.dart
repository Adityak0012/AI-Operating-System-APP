import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_item.dart';
import '../services/hive_service.dart';

class TasksNotifier extends StateNotifier<List<TaskItem>> {
  TasksNotifier() : super(HiveService.getTasks());

  void add(TaskItem item) {
    HiveService.addTask(item).then((_) {
      state = HiveService.getTasks();
    });
  }

  void delete(int index) {
    HiveService.deleteTask(index).then((_) {
      state = HiveService.getTasks();
    });
  }

  void toggle(int index) {
    HiveService.toggleTask(index).then((_) {
      state = HiveService.getTasks();
    });
  }

  void refresh() {
    state = HiveService.getTasks();
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, List<TaskItem>>(
  (ref) => TasksNotifier(),
);
