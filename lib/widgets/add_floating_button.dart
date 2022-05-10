import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_list_view_model.dart';

class AddFloatingButton extends StatelessWidget {
  AddFloatingButton({Key? key}) : super(key: key);

  final TextEditingController _addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListViewModel>(
        builder: ((context, value, child) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TextField(
                              autofocus: true,
                              onSubmitted: (val) {
                                value.addTodo(val.trim());
                                Navigator.pop(context);
                              },
                              controller: _addController,
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintText: 'Add Todo',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF00a0c8)))),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  value.addTodo(
                                      _addController.value.text.trim());
                                  Navigator.pop(context);
                                },
                                child: const Text("Submit"),
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF00a0c8),
                                    fixedSize: const Size.fromHeight(48)))
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF00a0c8),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32.0,
                  semanticLabel: 'list check',
                ),
              ),
            )));
  }
}
