import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_life_os/core/providers/tasks_provider.dart';
import 'package:ai_life_os/core/providers/schedule_provider.dart';
import 'package:ai_life_os/core/providers/reminders_provider.dart';
import 'package:ai_life_os/core/providers/habits_provider.dart';

class OverviewStats extends ConsumerWidget {
  const OverviewStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider);
    final schedules = ref.watch(scheduleProvider);
    final reminders = ref.watch(remindersProvider);
    final habits = ref.watch(habitsProvider);

    final completedTasks = tasks.where((t) => t.isCompleted).length;
    final pendingReminders = reminders.where((r) => !r.isCompleted).length;
    final activeHabits = habits.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Overview",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                "View All >",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.task_alt,
                  number: "${tasks.length}",
                  label: "Tasks",
                  subtext: "$completedTasks Completed",
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.event,
                  number: "${schedules.length}",
                  label: "Events",
                  subtext: schedules.isEmpty ? "None today" : "Today",
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  icon: Icons.notifications_active_outlined,
                  number: "${reminders.length}",
                  label: "Reminders",
                  subtext: "$pendingReminders Pending",
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  icon: Icons.trending_up,
                  number: "$activeHabits",
                  label: "Habits",
                  subtext: "This week",
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String number,
    required String label,
    required String subtext,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 16),
          Text(number,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(subtext,
              style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
