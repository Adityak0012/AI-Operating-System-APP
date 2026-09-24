import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/habit_item.dart';
import '../services/hive_service.dart';

final habitsProvider = Provider<List<HabitItem>>((ref) {
  final box = Hive.box<HabitItem>(HiveService.habitsBox);
  return box.values.toList();
});
