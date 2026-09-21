import 'package:flutter/material.dart';
import '../widgets/update_card.dart';
import '../domain/update.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final updates = [
      Update(
        version: '2.4.0',
        date: '21 september 2026',
        title: 'Nieuwe functies',
        description: 
          'Nieuwe instellingen toegevoegd\n'
          'Verbeterde navigatie binnen de app\n'
          'Nieuwe zoekfunctie toegevoegd\n'
          'Prestaties van de app verbeterd'
        ,
      ),
      Update(
        version: '2.3.2',
        date: '12 september 2026',
        title: 'Verbeteringen',
        description: 
          'Verschillende bugs opgelost\n'
          'Snellere laadtijden\n'
          'Verbeterde animaties'
          ,
      ),
      Update(
        version: '2.3.0',
        date: '1 september 2026',
        title: 'Nieuw ontwerp',
        description: 
          'Volledig nieuw ontwerp\n'
          'Nieuwe kleuren en iconen\n'
          'Verbeterde gebruikerservaring\n'
          'Donkere modus verbeterd'
          ,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF7F7F9),
        foregroundColor: Colors.black,
        title: const Text(
          'Updates',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: updates.length,
        separatorBuilder: (_, _) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          return UpdateCard(update: updates[index]);
        },
      ),
    );
  }
}

