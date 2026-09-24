import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/schedule_item.dart';
import '../services/hive_service.dart';

final scheduleProvider = Provider<List<ScheduleItem>>((ref) {
  final box = Hive.box<ScheduleItem>(HiveService.scheduleBox);
  return box.values.toList();
});
