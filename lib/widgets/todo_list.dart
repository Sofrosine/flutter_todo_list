import 'package:flutter/material.dart';
import 'package:todo_list/view_model/todo_view_model.dart';
import 'package:todo_list/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoViewModel> list;

  const TodoList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final todo = list[index];

        return TodoItem(todo: todo);
      },
    );
  }
}
