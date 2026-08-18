import 'package:flutter/material.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

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
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.account_balance_wallet, color: Colors.blue, size: 20),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Expense Overview",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey, size: 24),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "This Month",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "₹18,450",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "↓12%",
                    style: TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Text(
              "vs last month",
              style: TextStyle(fontSize: 11, color: Colors.black38),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 160,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 30,
                      sections: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 40,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.orange,
                          value: 30,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.purple,
                          value: 15,
                          title: '',
                          radius: 20,
                        ),
                        PieChartSectionData(
                          color: Colors.green,
                          value: 15,
                          title: '',
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "View full report",
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
