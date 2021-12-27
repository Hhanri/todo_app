import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<String> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(
                  todos[index]
              ),
              child: Card(
                  child: ListTile(
                      title: Text(todos[index])
                  )
              )
          );
        });
  }
}