import 'package:hive/hive.dart';

part 'habit_item.g.dart';

@HiveType(typeId: 2)
class HabitItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int progress;

  HabitItem({
    required this.name,
    required this.progress,
  });
}
