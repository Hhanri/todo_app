import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/utils/navigation_utils.dart';
import 'package:todo_app/widgets/alert_dialog_widget.dart';
import 'package:todo_app/widgets/change_theme_button_widget.dart';
import 'package:todo_app/widgets/todo_card_widget.dart';
import 'package:todo_app/models/todo_task_model.dart';
import 'package:firebase_core/firebase_core.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  String _input = "";
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext initFirebaseContext, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          NavigationUtils.showMyDialog(context: initFirebaseContext, bodyText: Strings.errorFirebaseInit);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<QuerySnapshot<dynamic>>(
            stream: FirebaseFirestore.instance.collection(Strings.todoCollection).snapshots(),
            builder: (context, snapshots) {
              //List<QueryDocumentSnapshot<dynamic>> _docs = snapshots.data?.docs ?? [];
              return Scaffold(
                appBar: AppBar(
                  title: const Text(Strings.appTitle),
                  actions: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                        Strings.nightMode,
                      ),
                        ChangeThemeButtonWidget()
                      ],
                    )
                  ],
                ),
                body: ListView.builder(
                    itemCount: snapshots.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCardWidget(
                        todo: TodoTaskModel.fromJson(snapshots.data?.docs[index].data()),
                      );
                    }
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialogWidget(
                          onTodoChange: (value) {
                            _input = value;
                          },
                          onDateChange: (value) {
                            _date = value;
                          },
                          onPress: () {
                            if (_input != "") {
                              createTodos(
                                  todo: _input,
                                  deadline: _date
                              );
                            }
                            _input = "";
                            _date = null;
                            Navigator.of(context).pop();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        );
                      }
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white
                  ),
                ),
              );
            }
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

