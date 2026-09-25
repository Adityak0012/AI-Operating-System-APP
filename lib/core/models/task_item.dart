import 'package:hive/hive.dart';

part 'task_item.g.dart';

@HiveType(typeId: 3)
class TaskItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  int categoryColorValue;

  @HiveField(3)
  String dueDate;

  @HiveField(4)
  String priority; // High / Medium / Low

  @HiveField(5)
  int priorityColorValue;

  @HiveField(6)
  bool isCompleted;

  TaskItem({
    required this.title,
    required this.category,
    required this.categoryColorValue,
    required this.dueDate,
    required this.priority,
    required this.priorityColorValue,
    this.isCompleted = false,
  });
}
