import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_life_os/core/models/schedule_item.dart';
import 'package:ai_life_os/core/providers/schedule_provider.dart';
import 'package:ai_life_os/core/theme/app_colors.dart';

class AddScheduleSheet extends ConsumerStatefulWidget {
  const AddScheduleSheet({super.key});

  @override
  ConsumerState<AddScheduleSheet> createState() => _AddScheduleSheetState();
}

class _AddScheduleSheetState extends ConsumerState<AddScheduleSheet> {
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();

  static const _colors = [
    Color(0xFFFF9800), // orange
    Color(0xFF2196F3), // blue
    Color(0xFF4CAF50), // green
    Color(0xFF9C27B0), // purple
    Color(0xFFF44336), // red
    Color(0xFF00BCD4), // cyan
  ];

  int _selectedColorIndex = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _save() {
    final title = _titleController.text.trim();
    final time = _timeController.text.trim();
    if (title.isEmpty || time.isEmpty) return;
    ref.read(scheduleProvider.notifier).add(
          ScheduleItem(
            title: title,
            time: time,
            colorValue: _colors[_selectedColorIndex].value,
          ),
        );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24, right: 24, top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Add Schedule Event',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Event title',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _timeController,
            decoration: InputDecoration(
              labelText: 'Time (e.g. 10:00 AM)',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Color', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: List.generate(_colors.length, (i) {
              return GestureDetector(
                onTap: () => setState(() => _selectedColorIndex = i),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _colors[i],
                    shape: BoxShape.circle,
                    border: _selectedColorIndex == i
                        ? Border.all(color: Colors.black, width: 2.5)
                        : null,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Save Event',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
