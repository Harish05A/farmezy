class Job {
  final String id;
  final String title;
  final String description;
  final String location;
  final double wage;
  final DateTime datePosted;
  final DateTime deadline;
  final String? postedBy;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.wage,
    required this.datePosted,
    required this.deadline,
    this.postedBy,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      wage: json['wage'],
      datePosted: DateTime.parse(json['datePosted']),
      deadline: DateTime.parse(json['deadline']),
      postedBy: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'wage': wage,
      'datePosted': datePosted.toIso8601String(),
      'deadline': deadline.toIso8601String(),
    };
  }
}
