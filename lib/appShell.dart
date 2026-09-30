import 'package:festival_buddy/providers/connectivity_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppShell extends ConsumerWidget {
  const AppShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionState = ref.watch(connectionStateProvider);

        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: const Text('Festival Buddy'),
            ),
            actions: [
              connectionState.when(
                data: (isOnline) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      isOnline ? 'Online' : 'Offline',
                      style: TextStyle(
                        color: isOnline ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                ),
                loading: () => const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text('Checking...'),
                  ),
                ),
                error: (_, __) => const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      'Offline',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: child,
        );
  }
}