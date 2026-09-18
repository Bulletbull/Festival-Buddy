import 'package:flutter/material.dart';

/// A Material 3 card displaying a single event in the program.
class EventCard extends StatelessWidget {
  final String time;
  final String title;
  final String location;

  const EventCard({
    super.key,
    required this.time,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hour = time.split(':').first;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Text(
            hour,
            style: TextStyle(
              color: colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Row(
          children: [
            Icon(Icons.schedule, size: 14, color: colorScheme.outline),
            const SizedBox(width: 4),
            Text(time),
            const SizedBox(width: 12),
            Icon(Icons.place, size: 14, color: colorScheme.outline),
            const SizedBox(width: 4),
            Flexible(child: Text(location)),
          ],
        ),
      ),
    );
  }
}