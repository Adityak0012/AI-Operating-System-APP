import 'package:flutter/material.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';

class PlannerDateStrip extends StatelessWidget {
  const PlannerDateStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> days = [
      {"day": "Sun", "date": "12", "hasEvent": false},
      {"day": "Mon", "date": "13", "hasEvent": true},
      {"day": "Tue", "date": "14", "hasEvent": false},
      {"day": "Wed", "date": "15", "hasEvent": true}, // Selected
      {"day": "Thu", "date": "16", "hasEvent": false},
      {"day": "Fri", "date": "17", "hasEvent": true},
      {"day": "Sat", "date": "18", "hasEvent": false},
    ];
    
    const int selectedIndex = 3; // Wed 15

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(days.length, (index) {
          final isSelected = index == selectedIndex;
          final dayData = days[index];
          
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dayData["day"],
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white70 : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dayData["date"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                // Dot indicator
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dayData["hasEvent"] 
                        ? (isSelected ? Colors.white : AppColors.primary)
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
