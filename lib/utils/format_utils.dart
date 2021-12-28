import 'package:intl/intl.dart';

extension FormatDate on DateTime? {
  String displayDate() {
    return DateFormat('dd/MM/yyyy').format(this ?? DateTime.now());
  }
}