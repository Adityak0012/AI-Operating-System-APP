import 'package:flutter/material.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      {"icon": Icons.edit_note, "label": "New Note", "color": Colors.orange},
      {"icon": Icons.add_task, "label": "Add Task", "color": Colors.blue},
      {"icon": Icons.mic, "label": "Voice Note", "color": Colors.purple},
      {"icon": Icons.document_scanner, "label": "Scan Doc", "color": Colors.green},
      {"icon": Icons.receipt_long, "label": "Add Expense", "color": Colors.red},
      {"icon": Icons.chat, "label": "AI Chat", "color": AppColors.primary},
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quick Actions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Edit",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: actions.map((action) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: (action['color'] as Color).withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        action['icon'] as IconData,
                        color: action['color'] as Color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 72,
                      child: Text(
                        action['label'] as String,
                        style: const TextStyle(fontSize: 12, color: Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
