import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/text_button_widget.dart';

class AlertDialogWidget extends StatefulWidget {
  final List<TodoTaskModel> todos;
  final VoidCallback onPress;
  final ValueChanged onChange;

  const AlertDialogWidget({
    Key? key,
    required this.todos,
    required this.onPress,
    required this.onChange,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.addTodoList),
      content: TextField(
        decoration: InputDecoration(
          hintText: Strings.hintYourTodo
        ),
        onChanged: (String value) {
          widget.onChange(value);
        }
      ),
      actions: <Widget>[
        TextButtonWidget(
          onPress: widget.onPress,
        )
      ],
    );
  }
}
