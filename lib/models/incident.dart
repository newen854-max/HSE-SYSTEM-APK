class Incident {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String severity; // Low, Medium, High, Critical
  final String status; // Open, In Progress, Closed
  final String assignedTo;

  Incident({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.severity,
    required this.status,
    required this.assignedTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'severity': severity,
      'status': status,
      'assignedTo': assignedTo,
    };
  }

  factory Incident.fromMap(Map<String, dynamic> map) {
    return Incident(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: DateTime.parse(map['date'] ?? DateTime.now().toIso8601String()),
      severity: map['severity'] ?? 'Low',
      status: map['status'] ?? 'Open',
      assignedTo: map['assignedTo'] ?? '',
    );
  }
}
