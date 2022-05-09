import 'package:flutter/material.dart';
import 'package:todo_list/view_model/todo_view_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final TodoViewModel todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title),
      trailing: GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(80)),
                border: Border.all(width: 4, color: Colors.blue)),
            child: _isChecked
                ? const Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 24.0,
                    semanticLabel: 'list check',
                  )
                : Container(),
          )),
    );
  }
}
