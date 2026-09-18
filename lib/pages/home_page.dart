
import 'package:festival_buddy/pages/map_page.dart';
import 'package:festival_buddy/pages/program_page.dart';
import 'package:flutter/material.dart';
import '../widgets/nav_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Event Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event, size: 80, color: colorScheme.primary),
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapPage()),
              ),
            ),
            const SizedBox(height: 12),

            NavCard(
              icon: Icons.schedule,
              title: 'Event Program',
              subtitle: 'Check the schedule',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProgramPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}