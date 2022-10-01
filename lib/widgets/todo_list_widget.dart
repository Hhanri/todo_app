import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';

class TodoListWidget extends StatelessWidget {
  final List<TodoTaskModel> todos;
  const TodoListWidget({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoCardWidget(
            todo: todos[index],
            //onDismiss: (_) {},
            //onPress: () {},
          );
        }
    );
  }
}