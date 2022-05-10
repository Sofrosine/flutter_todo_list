import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_list_view_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title,
          style: TextStyle(
              decoration: widget.todo.isCheck
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.w600,
              color: widget.todo.isCheck ? Colors.grey : Colors.black)),
      trailing: Consumer<TodoListViewModel>(
        builder: ((context, model, child) => GestureDetector(
            onTap: () {
              setState(() {
                widget.todo.isCheck = !widget.todo.isCheck;
              });
              model.handleSelectTodo(widget.todo, widget.todo.isCheck);
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  border: Border.all(width: 4, color: const Color(0xFF00a0c8))),
              child: widget.todo.isCheck
                  ? const Icon(
                      Icons.check,
                      color: Color(0xFF00a0c8),
                      size: 24.0,
                      semanticLabel: 'list check',
                    )
                  : Container(),
            ))),
      ),
    );
  }
}
