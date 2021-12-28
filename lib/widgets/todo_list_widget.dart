import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';

class TodoListWidget extends StatefulWidget {
  final List<TodoTaskModel> todos;
  const TodoListWidget({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
        return ListView.builder(
          itemCount: widget.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoCardWidget(
              todos: widget.todos,
              index: index,
              //onDismiss: (_) {},
              //onPress: () {},
            );
          }

    );
  }
}