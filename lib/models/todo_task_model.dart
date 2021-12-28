import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/resources/strings.dart';

class TodoTaskModel {

  final String todo;
  final DateTime? deadLine;

  TodoTaskModel({
    required this.todo,
    this.deadLine});

  static Map<String, dynamic> toMap(TodoTaskModel todoTaskModel) => {
    Strings.todoTaskModelTitle : todoTaskModel.todo,
    Strings.todoTaskModelDeadline : todoTaskModel.deadLine
  };

  factory TodoTaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TodoTaskModel(
        todo: jsonData[Strings.todoTaskModelTitle],
        //deadLine: jsonData[Strings.todoTaskModelDeadline].toDate(),
    );
  }

  static String encodeTodoTask(List<TodoTaskModel> todos) {
    return json.encode(
      todos.map(
        (todo) => TodoTaskModel.toMap(todo))
    );
  }

  static List<TodoTaskModel> decodeTodoTask(List<QueryDocumentSnapshot<dynamic>> queryTodo) {
    return queryTodo.map(
      (todo) => TodoTaskModel.fromJson(todo.data())
    ).toList();
  }
}


void createTodos({required String todo, DateTime? deadline}){
  TodoTaskModel _todoTaskModel = TodoTaskModel(
      todo: todo,
      deadLine: deadline
  );
  FirebaseFirestore
      .instance
      .collection(Strings.TodoCollection)
      .doc(_todoTaskModel.todo)
      .set(TodoTaskModel.toMap(_todoTaskModel));
}

void deleteTodos({required String item}) {
  FirebaseFirestore
      .instance
      .collection(Strings.TodoCollection)
      .doc(item)
      .delete();
}