class Event {
  final int id;
  final String name;
  final String date;

  Event({
    required this.id,
    required this.name,
    required this.date,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['event_id'] as int,
      name: map['name'] as String,
      date: map['date'] as String,
    );
  }
}