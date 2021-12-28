import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/resources/strings.dart';
import 'package:todo_app/utils/format_utils.dart';

class TextFieldWidget extends StatefulWidget {

  final ValueChanged<String>? valueChanged;
  final ValueChanged<DateTime?>? dateValueChanged;
  final TextFieldParamaters textFieldParameters;
  final TextEditingController? textEditingController;

  const TextFieldWidget({
    Key? key,
    this.valueChanged,
    this.dateValueChanged,
    required this.textFieldParameters,
    this.textEditingController
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  late final TextFieldParamaters _textFieldParamaters;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textFieldParamaters = widget.textFieldParameters;
    _textEditingController = widget.textEditingController ?? TextEditingController();
    if (_textFieldParamaters is DateTextFieldParameters){
      _textFieldParamaters.onTap= _tapFunction;
    }
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.valueChanged,
      controller: _textEditingController,
      readOnly: (_textFieldParamaters.readOnly == true) ? true : false ,
      inputFormatters: _textFieldParamaters.textInputFormatters,
      decoration: InputDecoration(
        hintText: _textFieldParamaters.hintText
      ),
      onTap: _textFieldParamaters.onTap,
    );
  }

  Future<DateTime?> _pickDate() async {
    DateTime? _picked;
    _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 100)
    );
    if(_picked != null) {
      setState(() => _textEditingController?.text = _picked.displayDate());
    }
    return _picked;
  }

  void _tapFunction() {
    FocusScope.of(context).requestFocus(FocusNode());
    _pickDate().then((DateTime? value) {
      widget.dateValueChanged!(value);
    });
  }
}

class TextFieldParamaters {
  final String? hintText;
  VoidCallback? onTap;
  List<TextInputFormatter>? textInputFormatters;
  bool? readOnly;

  TextFieldParamaters({
    required this.hintText,
    this.textInputFormatters,
    this.onTap,
    this.readOnly,
  });
}

class DateTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  DateTextFieldParameters({
    this.hintText = Strings.hintDate,
  }) : super(
      hintText: hintText,
      textInputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9/]"))],
      readOnly: true
  );
}

class TodoTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  TodoTextFieldParameters({
    this.hintText = Strings.hintYourTodo,
  }) : super(
    hintText: hintText,
  );
}