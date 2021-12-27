import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/alert_dialog_widget.dart';
import 'package:todo_app/widgets/todo_list_widget.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  List<String> todos = [];
  String _input = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("item1");
    todos.add("item2");
    todos.add("item3");
    todos.add("item4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle)
      ),
      body: TodoListWidget(todos: todos),
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
                    todos.add(_input);
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

