import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/nav_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            size: 80,
            color: colorScheme.primary,
          ),

          const SizedBox(height: 16),

          Text(
            'Welcome to the Event!',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          NavCard(
            icon: Icons.map,
            title: 'View Map',
            subtitle: 'See the venue location',
            onTap: () {
              context.go('/map');
            },
          ),

          const SizedBox(height: 12),

          NavCard(
            icon: Icons.schedule,
            title: 'Event Program',
            subtitle: 'Check the schedule',
            onTap: () {
              context.go('/program');
            },
          ),
        ],
      ),
    );
  }
}