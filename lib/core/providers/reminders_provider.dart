import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/reminder_item.dart';
import '../services/hive_service.dart';

final remindersProvider = Provider<List<ReminderItem>>((ref) {
  final box = Hive.box<ReminderItem>(HiveService.remindersBox);
  return box.values.toList();
});
