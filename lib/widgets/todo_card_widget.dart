import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/resources/theme.dart';

class TodoCardWidget extends StatelessWidget {
  final int index;
  final List<TodoTaskModel> todos;
  //final VoidCallback onPress;
  //final DismissDirectionCallback onDismiss;
  const TodoCardWidget({
    Key? key,
    required this.todos,
    required this.index,
    //required this.onPress,
    //required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        todos[index].todo
      ),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: MyShapes.circularBorders
        ),
        child: ListTile(
          title: Text(todos[index].todo),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              deleteTodos(item: todos[index].todo);
            },
          ),
        )
      ),
      onDismissed: (_) {
        deleteTodos(item: todos[index].todo);
      },
    );
  }
}