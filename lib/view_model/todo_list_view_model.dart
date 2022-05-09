import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/service/web_service.dart';
import 'package:todo_list/view_model/todo_view_model.dart';

class TodoListViewModel extends ChangeNotifier {
  List<TodoViewModel> todos = [];

  Future<void> getTodos() async {
    final results = await Localservice().getTodos();
    if (results.length > 0) {
      todos = results.map((item) => TodoViewModel(todo: item)).toList();
    }
    notifyListeners();
  }

  Future<void> addTodo() async {
    final prefs = await SharedPreferences.getInstance();

    List<TodoViewModel> listTodos = [
      TodoViewModel(
          todo: Todo.fromMap(
              {"title": "Belajar", "date": DateTime.now().toString()}))
    ];
    todos
        .map((todo) => listTodos.add(TodoViewModel(
            todo: Todo.fromMap({"title": todo.title, "date": todo.date}))))
        .toList();
    todos = listTodos;
    String encodedList = json.encode(todos);
    prefs.setString('todolist', encodedList);
    notifyListeners();
  }

  Future<void> clearTodo() async {
    final prefs = await SharedPreferences.getInstance();
    todos = [];
    prefs.clear();
    notifyListeners();
  }
}
