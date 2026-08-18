import 'package:flutter/material.dart';

class DummyData {
  static const String userName = "Aditya";

  static final List<Map<String, dynamic>> scheduleItems = [
    {
      "title": "Team Standup",
      "time": "10:00 AM",
      "color": Colors.orange,
    },
    {
      "title": "Design Review",
      "time": "11:30 AM",
      "color": Colors.blue,
    },
    {
      "title": "Lunch with Sarah",
      "time": "1:00 PM",
      "color": Colors.green,
    },
  ];

  static final List<Map<String, dynamic>> reminders = [
    {
      "title": "Drink water",
      "time": "Every 2 hours",
      "isCompleted": false,
    },
    {
      "title": "Reply to emails",
      "time": "12:00 PM",
      "isCompleted": false,
    },
    {
      "title": "Pay electricity bill",
      "time": "Before 5:00 PM",
      "isCompleted": false,
    },
  ];

  static final List<Map<String, dynamic>> habits = [
    {
      "name": "Meditation",
      "progress": 5, // out of 7
    },
    {
      "name": "Reading",
      "progress": 3,
    },
    {
      "name": "Workout",
      "progress": 6,
    },
  ];

  static const double currentMonthExpense = 18450.0;
  static const double expenseChangePercentage = 12.0;
  static const bool isExpenseDown = true;

  // --- Planner Screen Dummy Data ---
  
  static final List<Map<String, dynamic>> plannerScheduleItems = [
    {
      "title": "Team Standup",
      "subtitle": "Daily sync with the core team",
      "startTime": "09:30\nAM",
      "endTime": "10:00\nAM",
      "color": Colors.orange,
      "icon": Icons.groups_outlined,
      "hasReminder": true,
    },
    {
      "title": "Design Review",
      "subtitle": "Review new planner mockups",
      "startTime": "11:00\nAM",
      "endTime": "12:30\nPM",
      "color": Colors.purple,
      "icon": Icons.design_services_outlined,
      "hasReminder": false,
    },
    {
      "title": "Lunch Break",
      "subtitle": "Take a walk outside",
      "startTime": "01:00\nPM",
      "endTime": "02:00\nPM",
      "color": Colors.green,
      "icon": Icons.restaurant_menu_outlined,
      "hasReminder": false,
    },
    {
      "title": "Project Work",
      "subtitle": "Deep work session",
      "startTime": "02:30\nPM",
      "endTime": "04:30\nPM",
      "color": Colors.blue,
      "icon": Icons.computer_outlined,
      "hasReminder": true,
    },
    {
      "title": "Client Call",
      "subtitle": "Discuss Q3 roadmap",
      "startTime": "05:00\nPM",
      "endTime": "06:00\nPM",
      "color": Colors.redAccent,
      "icon": Icons.call_outlined,
      "hasReminder": true,
    },
  ];

  static final List<Map<String, dynamic>> plannerTasks = [
    {
      "title": "Finalize UI Assets",
      "category": "Design",
      "categoryColor": Colors.purple,
      "dueDate": "Today, 4:00 PM",
      "priority": "High",
      "priorityColor": Colors.red,
    },
    {
      "title": "Update API Docs",
      "category": "Work",
      "categoryColor": Colors.blue,
      "dueDate": "Tomorrow, 10:00 AM",
      "priority": "Medium",
      "priorityColor": Colors.orange,
    },
    {
      "title": "Buy Groceries",
      "category": "Personal",
      "categoryColor": Colors.green,
      "dueDate": "Today, 7:00 PM",
      "priority": "Low",
      "priorityColor": Colors.green,
    },
  ];
}
