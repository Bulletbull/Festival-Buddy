class Update {
  final String date;
  final String title;
  final String description;

  Update({
    required this.date,
    required this.title,
    required this.description,
  });

  factory Update.fromMap(Map<String, dynamic> map) {
    return Update(
      date: map['date'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
