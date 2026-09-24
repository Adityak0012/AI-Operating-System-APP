import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://your-api.com/api/', // Replace with your actual API base URL
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  static Future<Map<String, dynamic>> getUserProfile() async {
    final res = await _dio.get('user/profile');
    return res.data;
  }

  static Future<List<dynamic>> getSchedule() async {
    final res = await _dio.get('schedule/today');
    return res.data;
  }

  static Future<List<dynamic>> getReminders() async {
    final res = await _dio.get('reminders');
    return res.data;
  }

  static Future<List<dynamic>> getHabits() async {
    final res = await _dio.get('habits');
    return res.data;
  }

  static Future<List<dynamic>> getPlannerSchedule() async {
    final res = await _dio.get('planner/schedule');
    return res.data;
  }

  static Future<List<dynamic>> getPlannerTasks() async {
    final res = await _dio.get('planner/tasks');
    return res.data;
  }
}
