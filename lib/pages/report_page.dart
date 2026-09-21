import 'package:flutter/material.dart';
import '../widgets/report_card.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const SafeArea(
        child: ReportCard(),
      ),
    );
  }
}