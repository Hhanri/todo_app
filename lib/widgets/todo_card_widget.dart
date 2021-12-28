import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:todo_app/resources/theme.dart';
import 'package:todo_app/utils/format_utils.dart';

class TodoCardWidget extends StatelessWidget {
  final int index;
  final List<TodoTaskModel> todos;
  const TodoCardWidget({
    Key? key,
    required this.todos,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        todos[index].todo
      ),
      child: Card(
        color: todos[index].deadLine?.getCardColor(),
        elevation: 3,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: MyShapes.circularBorders
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:2, vertical: 4.0),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                todos[index].todo,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            subtitle: (todos[index].deadLine != null)
              ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                    todos[index].deadLine.displayDate(),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: todos[index].deadLine?.getDateColor()
                    ),
                ),
              )
              : null,
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: todos[index].deadLine?.getIconColor(),
              ),
              onPressed: () {
                deleteTodos(item: todos[index].todo);
              },
            ),
          ),
        )
      ),
      onDismissed: (_) {
        deleteTodos(item: todos[index].todo);
      },
    );
  }
}