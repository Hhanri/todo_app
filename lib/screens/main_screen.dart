import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/alert_dialog_widget.dart';
import 'package:todo_app/widgets/todo_list_widget.dart';
import 'package:todo_app/models/todo_task_model.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  List<TodoTaskModel> _todos = [];
  String _input = "";

  @override
  void initState() {
    super.initState();
    for (int i = 1; i<5; i++) {
      _todos.add(TodoTaskModel(todo: 'item $i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle)
      ),
      body: TodoListWidget(todos: _todos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialogWidget(
                onChange: (value) {
                  _input = value;
                },
                onPress: () {
                  setState(() {
                    _todos.add(TodoTaskModel(todo: _input));
                  });
                  Navigator.of(context).pop();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white
        ),
      ),
    );
  }
}

