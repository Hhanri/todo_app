import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/resources/theme.dart';
import 'package:todo_app/screens/main_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lighTheme,
          darkTheme: MyThemes.darkTheme,
          home: TodoApp(),
        );
      },

    ),
  );
}



