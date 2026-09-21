import 'package:flutter/material.dart';
import '../widgets/location_card.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: const Text('Venue Map'),
      ),
      body: Column(
        children: [
          // --- Placeholder map area ---
          Expanded(
            child: Container(
              color: colorScheme.surfaceContainerHighest,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 100, color: colorScheme.primary),
                    const SizedBox(height: 16),
                    Text(
                      'Map will appear here',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Add map here.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          LocationCard(
            title: 'Event Venue',
            address: '123 Main Street, Your City',
            onDirectionsPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening directions...')),
              );
            },
          ),
        ],
      ),
    );
  }
}