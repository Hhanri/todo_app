import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/widgets/text_button_widget.dart';
import 'package:todo_app/widgets/text_field_widget.dart';

class AlertDialogWidget extends StatefulWidget {
  final VoidCallback onPress;
  final ValueChanged? onTodoChange;
  final ValueChanged? onDateChange;

  const AlertDialogWidget({
    Key? key,
    required this.onPress,
    required this.onTodoChange,
    required this.onDateChange,
  }) : super(key: key);

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(Strings.addTodoList),
      content: Column(
        children: [
          TextFieldWidget(
            valueChanged: (value) {
              widget.onTodoChange!(value);
            },
            textFieldParameters: TodoTextFieldParameters()
          ),
          TextFieldWidget(
            dateValueChanged: (value) {
              widget.onDateChange!(value);
            }, textFieldParameters: DateTextFieldParameters(),
          )
        ],
      ),
      actions: <Widget>[
        TextButtonWidget(
          onPress: widget.onPress,
        )
      ],
    );
  }
}
