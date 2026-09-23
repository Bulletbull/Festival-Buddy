
import 'package:festival_buddy/providers/program/programs_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/event_card.dart';

class ProgramPage extends ConsumerWidget {
  const ProgramPage({super.key});

  final List<Map<String, String>> _events = const [
    {'time': '09:00', 'title': 'Opening Ceremony', 'location': 'Main Hall'},
    {'time': '10:30', 'title': 'Keynote: The Future of Tech', 'location': 'Main Hall'},
    {'time': '12:00', 'title': 'Lunch Break', 'location': 'Garden Terrace'},
    {'time': '13:30', 'title': 'Workshop: Design Systems', 'location': 'Room A'},
    {'time': '15:00', 'title': 'Panel Discussion', 'location': 'Main Hall'},
    {'time': '17:00', 'title': 'Closing & Networking', 'location': 'Rooftop'},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final events = ref.watch(programsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Event Program'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _events.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final event = _events[index];
          return EventCard(
            time: event['time']!,
            title: event['title']!,
            location: event['location']!,
          );
        },
      ),
    );
  }
}