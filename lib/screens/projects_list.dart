import 'package:flutter/material.dart';


class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    this.onTap,
    String? description,
  }) : description = description ?? 'Нет описания.';

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
              const SizedBox(width: 16),
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

class ProjectsListScreen extends StatefulWidget {
  const ProjectsListScreen({super.key});

  @override
  State<ProjectsListScreen> createState() => _ProjectsListScreenState();
}

class _ProjectsListScreenState extends State<ProjectsListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ProjectCard(
          title: 'Создание приложения на Flutter',
          onTap: () {
            print('Project 1');
          },
        ),
        ProjectCard(
          title: 'Исправление багов',
          description: 'Тут задачи по исправлению багов.',
          onTap: () {
            print('Project 2');
          },
        ),
      ],
    );
  }
}