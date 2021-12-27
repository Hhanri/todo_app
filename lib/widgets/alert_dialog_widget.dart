import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/text_button_widget.dart';

class AlertDialogWidget extends StatefulWidget {

  final ValueChanged onChange;
  final GestureTapCallback onPress;

  const AlertDialogWidget({
    Key? key,
    required this.onChange,
    required this.onPress,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.addTodoList),
      content: TextField(
          onChanged: (String value) {
            widget.onChange(value);
          }
      ),
      actions: <Widget>[
        TextButtonWidget(
          onPress: widget.onPress
        )
      ],
    );
  }
}
