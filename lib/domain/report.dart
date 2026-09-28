class Report {
  final int id;
  final String name;
  final String message;


  Report({
    required this.id,
    required this.name,
    required this.message,
  });

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['report_id'] as int,
      name: map['name'] as String,
      message: map['message'] as String,
    );
  }
}