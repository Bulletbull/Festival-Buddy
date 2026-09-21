import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updates = [
      Update(
        version: '2.4.0',
        date: '21 september 2026',
        title: 'Nieuwe functies',
        changes: [
          'Nieuwe instellingen toegevoegd',
          'Verbeterde navigatie binnen de app',
          'Nieuwe zoekfunctie toegevoegd',
          'Prestaties van de app verbeterd',
        ],
      ),
      Update(
        version: '2.3.2',
        date: '12 september 2026',
        title: 'Verbeteringen',
        changes: [
          'Verschillende bugs opgelost',
          'Snellere laadtijden',
          'Verbeterde animaties',
        ],
      ),
      Update(
        version: '2.3.0',
        date: '1 september 2026',
        title: 'Nieuw ontwerp',
        changes: [
          'Volledig nieuw ontwerp',
          'Nieuwe kleuren en iconen',
          'Verbeterde gebruikerservaring',
          'Donkere modus verbeterd',
        ],
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
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          return UpdateCard(update: updates[index]);
        },
      ),
    );
  }
}

class UpdateCard extends StatefulWidget {
  final Update update;

  const UpdateCard({
    super.key,
    required this.update,
  });

  @override
  State<UpdateCard> createState() => _UpdateCardState();
}

class _UpdateCardState extends State<UpdateCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE8E8EC),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Versie icoon
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.system_update_rounded,
                      color: Color(0xFF5B5BD6),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // Tekst
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.update.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Versie ${widget.update.version} • '
                          '${widget.update.date}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Pijl
                  AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Uitklapbare inhoud
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),

                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Wat is er veranderd?',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...widget.update.changes.map(
                    (change) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5B5BD6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              change,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Update {
  final String version;
  final String date;
  final String title;
  final List<String> changes;

  Update({
    required this.version,
    required this.date,
    required this.title,
    required this.changes,
  });
}