class Ticket {
  final String id;
  final String userId;
  final String issue;
  final String description;
  final DateTime dateRaised;
  final DateTime deadline;

  Ticket({
    required this.id,
    required this.userId,
    required this.issue,
    required this.description,
    required this.dateRaised,
    required this.deadline,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      userId: json['userId'],
      issue: json['issue'],
      description: json['description'],
      dateRaised: DateTime.parse(json['dateRaised']),
      deadline: DateTime.parse(json['deadline']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'issue': issue,
      'description': description,
      'dateRaised': dateRaised.toIso8601String(),
      'deadline': deadline.toIso8601String(),
    };
  }
}
