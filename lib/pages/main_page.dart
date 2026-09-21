import 'package:festival_buddy/pages/home_page.dart';
import 'package:festival_buddy/pages/map_page.dart';
import 'package:festival_buddy/pages/program_page.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = const [
    HomePage(),
    ProgramPage(),
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festival Buddy'),
      ),
      body: pages[index],
    );
  }
}