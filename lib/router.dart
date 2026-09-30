import 'package:festival_buddy/AppShell.dart';



import 'package:go_router/go_router.dart';


import 'pages/home_page.dart';
import 'pages/map_page.dart';
import 'pages/program_page.dart';
import 'pages/update_page.dart';
import 'pages/report_page.dart';





final router = GoRouter(
  routes: [
    ShellRoute(
  builder: (context, state, child) {
    return AppShell(child: child);
  },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/program',
          builder: (context, state) => const ProgramPage(),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapPage(),
        ),
        GoRoute(
          path: '/updates',
          builder: (context, state) => const UpdatesPage(),
        ),
        GoRoute(
          path: '/report',
          builder: (context, state) => const ReportPage(),
        ),
      ],
    ),
  ],
);