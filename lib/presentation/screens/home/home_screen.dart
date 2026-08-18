import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/home_header.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/ai_briefing_card.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/date_strip.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/schedule_card.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/reminders_card.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/habit_card.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/expense_card.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/quick_actions_row.dart';
import 'package:ai_life_os/presentation/screens/home/widgets/motivation_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const Drawer(
        child: SafeArea(
          child: Center(
            child: Text('Drawer Placeholder'),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const AiBriefingCard(),
                    const SizedBox(height: 24),
                    const DateStrip(),
                    const SizedBox(height: 24),
                    
                    // Single-column full-width layout of dashboard cards
                    const Column(
                      children: [
                        ScheduleCard(),
                        SizedBox(height: 16),
                        RemindersCard(),
                        SizedBox(height: 16),
                        HabitCard(),
                        SizedBox(height: 16),
                        ExpenseCard(),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    const QuickActionsRow(),
                    const SizedBox(height: 24),
                    const MotivationCard(),
                    const SizedBox(height: 64), // 64 + 16 (padding) = 80px total padding for bottom nav bar
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
