import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/resources/theme.dart';
import 'package:todo_app/utils/format_utils.dart';

class TodoCardWidget extends StatelessWidget {
  final TodoTaskModel todo;
  const TodoCardWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        todo.todo
      ),
      child: Card(
        color: todo.deadLine?.getCardColor(),
        elevation: 3,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: MyShapes.circularBorders
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:2, vertical: 4.0),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                todo.todo,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            subtitle: (todo.deadLine != null)
              ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    todo.deadLine.displayDate(),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: todo.deadLine?.getDateColor()
                    ),
                ),
              )
              : null,
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: todo.deadLine?.getIconColor(),
              ),
              onPressed: () {
                deleteTodos(item: todo.todo);
              },
            ),
          ),
        )
      ),
      onDismissed: (_) {
        deleteTodos(item: todo.todo);
      },
    );
  }
}