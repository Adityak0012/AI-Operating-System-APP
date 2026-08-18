import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/planner_header.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/tab_selector.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/planner_date_strip.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/overview_stats.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/schedule_timeline.dart';
import 'package:ai_life_os/presentation/screens/planner/widgets/upcoming_tasks.dart';

class PlannerScreen extends ConsumerWidget {
  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PlannerHeader(),
              SizedBox(height: 8),
              TabSelector(),
              SizedBox(height: 24),
              PlannerDateStrip(),
              SizedBox(height: 32),
              OverviewStats(),
              SizedBox(height: 32),
              ScheduleTimeline(),
              SizedBox(height: 32),
              UpcomingTasks(),
              SizedBox(height: 80), // Padding for bottom nav bar
            ],
          ),
        ),
      ),
    );
  }
}
