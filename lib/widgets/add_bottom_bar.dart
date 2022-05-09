import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/view_model/todo_list_view_model.dart';
import 'package:todo_list/view_model/todo_view_model.dart';

class AddBottomBar extends StatelessWidget {
  const AddBottomBar({Key? key, required this.todos}) : super(key: key);

  final List<TodoViewModel> todos;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<TodoListViewModel>(context, listen: false).addTodo();
              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return SizedBox(
              //         height: MediaQuery.of(context).size.height / 1.5,
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             ListTile(
              //               leading: new Icon(Icons.photo),
              //               title: new Text('Photo'),
              //               onTap: () {
              //                 Navigator.pop(context);
              //               },
              //             ),
              //           ],
              //         ),
              //       );
              //     });
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 32.0,
                semanticLabel: 'list check',
              ),
            ),
          )
        ],
      ),
      elevation: 0,
    );
  }
}
