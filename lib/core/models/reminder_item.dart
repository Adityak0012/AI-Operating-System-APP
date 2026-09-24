import 'package:hive/hive.dart';

part 'reminder_item.g.dart';

@HiveType(typeId: 1)
class ReminderItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String time;

  @HiveField(2)
  bool isCompleted;

  ReminderItem({
    required this.title,
    required this.time,
    this.isCompleted = false,
  });
}
