import 'package:todo_list/models/todo.dart';

class TodoViewModel {
  final Todo todo;

  TodoViewModel({required this.todo});

  String get title {
    return todo.title;
  }

  String get date {
    return todo.date;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "date": date,
    };
  }
}
