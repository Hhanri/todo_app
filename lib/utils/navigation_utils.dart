import 'package:flutter/material.dart';
import 'package:todo_app/resources/strings.dart';

class NavigationUtils {
  static void showMyDialog({
    required BuildContext context,
    required String bodyText,
    VoidCallback? onClick
  }) {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: Text(
              bodyText,
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: onClick ?? () => Navigator.of(context).pop(),
                  child: Text(
                    Strings.ok,
                    textAlign: TextAlign.center,
                  )
                ),
              )
            ]
          );
        }
    );
  }


  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor
            )
          )
        );
      },
    );
  }
}