
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/update_provider.dart';
import '../widgets/update_card.dart';

class UpdatesPage extends ConsumerWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final updatesAsync = ref.watch(updatesProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Updates'),
      ),
      body: updatesAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text('Updates laden mislukt: $error'),
        ),
        data: (updates) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: updates.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
          final update = updates[index];

          return UpdateCard(
            update: update,
          );
          },
        ),
      ),
    );
  }
}
