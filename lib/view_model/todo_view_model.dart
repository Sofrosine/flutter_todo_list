import 'package:todo_list/models/todo.dart';

class TodoViewModel {
  final Todo todo;
  bool isCheck = false;

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
