import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final userProfileProvider = FutureProvider((ref) => ApiService.getUserProfile());
final scheduleProvider = FutureProvider((ref) => ApiService.getSchedule());
final remindersProvider = FutureProvider((ref) => ApiService.getReminders());
final habitsProvider = FutureProvider((ref) => ApiService.getHabits());
final plannerScheduleProvider = FutureProvider((ref) => ApiService.getPlannerSchedule());
final plannerTasksProvider = FutureProvider((ref) => ApiService.getPlannerTasks());
