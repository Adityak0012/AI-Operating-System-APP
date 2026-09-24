import 'package:hive/hive.dart';

part 'schedule_item.g.dart';

@HiveType(typeId: 0)
class ScheduleItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String time;

  @HiveField(2)
  int colorValue;

  ScheduleItem({
    required this.title,
    required this.time,
    required this.colorValue,
  });
}
