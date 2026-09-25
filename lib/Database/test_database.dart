
import 'package:sqflite/sqflite.dart';

Future<void> seedDatabase(Database db) async {
  // =========================
  // SYNC METADATA
  // =========================

  await db.insert('sync_metadata', {
    'key': 'program',
    'version': 0,
  });

  await db.insert('sync_metadata', {
    'key': 'map',
    'version': 0,
  });


  // =========================
  // EVENTS
  // =========================

  await db.insert('events', {
    'name': 'Opening Festival',
    'date': '2026-07-10',
    'location': 'Main Stage',
  });

  await db.insert('events', {
    'name': 'Live Music',
    'date': '2026-07-11',
    'location': 'Concert Hall',
  });

  await db.insert('events', {
    'name': 'Food Festival',
    'date': '2026-07-12',
    'location': 'Food Court',
  });

  await db.insert('events', {
    'name': 'Closing Party',
    'date': '2026-07-13',
    'location': 'Dance Floor',
  });


  // =========================
  // MAP
  // =========================

  // Voorlopig voorbeelddata.
  // Een echte kaart kun je later als bytes/BLOB opslaan.
  await db.insert('map', {
    'map': [1, 2, 3, 4, 5],
  });


  // =========================
  // UPDATES
  // =========================

  await db.insert('updates', {
    'title': 'Festival opening',
    'description': 'Het festival opent om 12:00.',
    'date': '2026-07-10',
  });

  await db.insert('updates', {
    'title': 'Programma gewijzigd',
    'description': 'Het optreden van de band is verplaatst.',
    'date': '2026-07-11',
  });

  await db.insert('updates', {
    'title': 'Nieuwe artiest toegevoegd',
    'description': 'Er is een nieuwe artiest toegevoegd aan het programma.',
    'date': '2026-07-12',
  });


  // =========================
  // REPORT FORM
  // =========================

  await db.insert('Reportform', {
    'name': 'Kapotte verlichting',
    'message': 'De verlichting bij de ingang werkt niet.',
  });

  await db.insert('Reportform', {
    'name': 'Afval',
    'message': 'Er ligt veel afval bij het foodcourt.',
  });

  await db.insert('Reportform', {
    'name': 'Defecte ingang',
    'message': 'Een van de toegangspoorten werkt niet.',
  });
}

