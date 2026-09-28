

import 'package:festival_buddy/providers/services/signalR_service_provider.dart';
import 'package:festival_buddy/providers/services/sync_service_provider.dart';
import 'package:festival_buddy/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  // Start synchronization
  container.read(syncServiceProvider).start();

  // Start SignalR
  try {
    await container.read(syncSignalRServiceProvider).start();
  } catch (e) {
    debugPrint('SignalR connection failed: $e');
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
  title: 'Festival Buddy',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    ),
  ),
  routerConfig: router,
);
  }
}