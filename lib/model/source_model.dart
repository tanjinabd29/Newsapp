// Source model class
class Source {
  final String id;
  final String name;

  // Constructor
  Source({
    required this.id,
    required this.name,
  });

  // Factory function to map JSON to Source
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
