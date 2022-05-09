import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

class Localservice {
  Future<List<Todo>> getTodos() async {
    final prefs = await SharedPreferences.getInstance();

    String? encodedMap = prefs.getString('todolist');
    late List<dynamic> decodedMap;
    if (encodedMap != null) {
      decodedMap = json.decode(encodedMap);
    } else {
      decodedMap = [];
    }

    return decodedMap.map((todo) => Todo.fromMap(todo)).toList();
  }
}
