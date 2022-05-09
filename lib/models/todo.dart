import 'dart:convert';

class Todo {
  final String title;
  final String date;

  Todo({required this.title, required this.date});

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] ?? '',
      date: map['date'] ?? '',
    );
  }

  // factory Todo.fromJson(Map<String, dynamic> json) {
  //   return Todo(title: json["title"], date: json["date"]);
  // }

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
