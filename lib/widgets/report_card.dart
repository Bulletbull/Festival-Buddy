import 'package:flutter/material.dart';

class ReportCard extends StatefulWidget {
  const ReportCard({super.key});

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titelController =
      TextEditingController();

  final TextEditingController _berichtController =
      TextEditingController();

  @override
  void dispose() {
    _titelController.dispose();
    _berichtController.dispose();
    super.dispose();
  }

  void _meldingPlaatsen() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final titel = _titelController.text.trim();
    final bericht = _berichtController.text.trim();

    // Hier stuur je de melding bijvoorbeeld naar Firebase.
    print('Titel: $titel');
    print('Bericht: $bericht');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Melding geplaatst!'),
      ),
    );

    _titelController.clear();
    _berichtController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Nieuwe melding',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Vul hieronder de titel en de melding in.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 28),

          TextFormField(
            controller: _titelController,
            decoration: InputDecoration(
              labelText: 'Titel',
              hintText: 'Bijvoorbeeld: Kapotte straatverlichting',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.title),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vul een titel in';
              }

              return null;
            },
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: _berichtController,
            maxLines: 7,
            decoration: InputDecoration(
              labelText: 'Bericht',
              hintText: 'Beschrijf hier je melding...',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Icon(Icons.message_outlined),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vul een bericht in';
              }

              return null;
            },
          ),

          const SizedBox(height: 28),

          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _meldingPlaatsen,
              child: const Text(
                'Melding plaatsen',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}