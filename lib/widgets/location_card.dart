import 'package:flutter/material.dart';

/// A Material 3 card showing a location with a directions action.
class LocationCard extends StatelessWidget {
  final String title;
  final String address;
  final VoidCallback? onDirectionsPressed;

  const LocationCard({
    super.key,
    required this.title,
    required this.address,
    this.onDirectionsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(Icons.location_on, color: colorScheme.primary),
        title: Text(title),
        subtitle: Text(address),
        trailing: FilledButton.tonal(
          onPressed: onDirectionsPressed,
          child: const Text('Directions'),
        ),
      ),
    );
  }
}