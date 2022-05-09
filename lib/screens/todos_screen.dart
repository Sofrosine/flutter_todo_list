import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_list_view_model.dart';
import 'package:todo_list/widgets/add_bottom_bar.dart';
import 'package:todo_list/widgets/date_appbar.dart';
import 'package:todo_list/widgets/todo_list.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoListViewModel>(context, listen: false).getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TodoListViewModel>(context);

    return Scaffold(
        appBar: DateAppBar(),
        body: Container(
          child: TodoList(list: vm.todos),
          color: Colors.white,
        ),
        bottomNavigationBar: AddBottomBar(todos: vm.todos));
  }
}
