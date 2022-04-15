import 'package:flutter/material.dart';

class AlertUtils {
  static void showAlertDialog(context, title, message, positiveButtonText, {Function? onClick}) {
    Future<void> _alertDialogBuilder() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  onClick?.call();
                  Navigator.pop(context);
                },
                child: Text(positiveButtonText),
              )
            ],
          );
        },
      );
    }

    _alertDialogBuilder();
  }

  static void showCancelDialog(context, title, message, positiveButtonText, {Function? onClick}) {
    Future<void> _alertDialogBuilder() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onClick?.call();
                },
                child: Text(positiveButtonText),
              )
            ],
          );
        },
      );
    }

    _alertDialogBuilder();
  }

  static void showSnackBar(context, message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static dynamic showProgressDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 30,
                ),
                Text('Loading...')
              ],
            ),
          ),
        );
      },
    );
  }
}
