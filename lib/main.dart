import 'package:flutter/material.dart';
import 'package:todo_app/resources/theme.dart';
import 'package:todo_app/screens/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: TodoApp(),
    ),
  );
}



