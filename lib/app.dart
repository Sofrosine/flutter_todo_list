import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_list/screens/todos_screen.dart';
import 'package:todo_list/view_model/todo_list_view_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies MVVM Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal),
        home: ChangeNotifierProvider(
          create: (context) => TodoListViewModel(),
          child: const TodoListPage(),
        ));
  }
}
