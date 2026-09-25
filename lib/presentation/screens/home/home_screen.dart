import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: const Drawer(
          child: SafeArea(
            child: Center(child: Text('Drawer Placeholder')),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Dark gradient hero header block ──
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      const HomeHeader(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                        child: const AiBriefingCard(),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Dashboard body ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DateStrip(),
                    const SizedBox(height: 24),

                    _sectionHeader("Today's Schedule", onTap: () {}),
                    const SizedBox(height: 12),
                    const ScheduleCard(),

                    const SizedBox(height: 24),
                    _sectionHeader("Smart Reminders", onTap: () {}),
                    const SizedBox(height: 12),
                    const RemindersCard(),

                    const SizedBox(height: 24),
                    _sectionHeader("Habit Tracker", onTap: () {}),
                    const SizedBox(height: 12),
                    const HabitCard(),

                    const SizedBox(height: 24),
                    _sectionHeader("Expenses", onTap: () {}),
                    const SizedBox(height: 12),
                    const ExpenseCard(),

                    const SizedBox(height: 24),
                    const QuickActionsRow(),
                    const SizedBox(height: 24),
                    const MotivationCard(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, {VoidCallback? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See all",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
