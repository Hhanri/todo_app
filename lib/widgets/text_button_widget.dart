import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';

class TextButtonWidget extends StatefulWidget {

  final GestureTapCallback onPress;

  const TextButtonWidget({
    Key? key,
    required this.onPress
  }) : super(key: key);

  @override
  _TextButtonWidgetState createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPress,
        child: const Text(Strings.addTodoListButton)
    );
  }
}
