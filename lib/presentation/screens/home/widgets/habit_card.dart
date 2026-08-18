import 'package:flutter/material.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';
import 'package:ai_life_os/core/utils/dummy_data.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.trending_up, color: Colors.green, size: 20),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Habit Progress",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey, size: 24),
              ],
            ),
            const SizedBox(height: 16),
            ...DummyData.habits.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isLast = index == DummyData.habits.length - 1;
              final double progress = item['progress'] / 7.0;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item['name'],
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black87),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${item['progress']}/7 days",
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.green.withValues(alpha: 0.2),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                          minHeight: 6,
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    Divider(color: Colors.grey.withValues(alpha: 0.2), height: 1),
                ],
              );
            }),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "View all habits",
                  style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.chevron_right, color: AppColors.primary, size: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
