import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime? dueDateTime;
  final bool isDone;
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;

  const TaskCard({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isDone,
    this.dueDateTime,
    this.onTap,
    String? description,
  }) : description = description ?? 'Нет описания.'
  ;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key});

  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

class _TasksListScreenState extends State<TasksListScreen> {
  bool isChecked1 = false;
  bool isChecked2 = true;

  @override
  void initState() {
    super.initState();
    _loadCheckboxValues();
  }

  Future<void> _loadCheckboxValues() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked1 = prefs.getBool('isChecked1') ?? false;
      isChecked2 = prefs.getBool('isChecked2') ?? false;
    });
  }

  Future<void> _saveCheckboxValues() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isChecked1', isChecked1);
    await prefs.setBool('isChecked2', isChecked2);
  }

  void _updateCheckbox1(bool? value) {
    setState(() {
      isChecked1 = value ?? false;
    });
    _saveCheckboxValues();
  }

  void _updateCheckbox2(bool? value) {
    setState(() {
      isChecked2 = value ?? false;
    });
    _saveCheckboxValues();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TaskCard(
          title: 'Создание приложения на Flutter',
          onTap: () => print('Task 1'),
          onChanged: _updateCheckbox1,
          isDone: isChecked1,
        ),
        TaskCard(
          title: 'Исправление багов',
          description: 'Тут задачи по исправлению багов.',
          onTap: () => print('Task 2'),
          onChanged: _updateCheckbox2,
          isDone: isChecked2,
        ),
      ],
    );
  }
}