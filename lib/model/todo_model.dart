import 'dart:convert';

class TodoModel {
  final String title;
  final String description;

  TodoModel(
    this.title,
    this.description,
  );

  TodoModel copyWith({
    String? title,
    String? description,
  }) {
    return TodoModel(
      title ?? this.title,
      description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      map['title'] ?? '',
      map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source));

  @override
  String toString() => 'TodoModel(title: $title, description: $description)';
}
