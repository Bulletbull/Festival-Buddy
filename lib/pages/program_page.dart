import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/event_provider.dart';
import '../widgets/event_card.dart';

class ProgramPage extends ConsumerWidget {
  const ProgramPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final eventsAsync = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Event Program'),
      ),
      body: eventsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Events laden mislukt: $error')),
        data: (events) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: events.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final event = events[index];

            return EventCard(
              time: event.date.toString(),
              title: event.name.toString(),
              location: event.location.toString(),
            );
          },
        ),
      ),
    );
  }
}