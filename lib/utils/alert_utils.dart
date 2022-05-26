import 'package:flutter/material.dart';

class AlertUtils {
  static const _roundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(18.0),
    ),
  );

  static void showAlertDialog(
    context, {
    String title = 'App Alert',
    required String message,
    String positiveText = 'Ok',
    Function? onClick,
  }) {
    Future<void> _alertDialogBuilder() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(message),
            ),
            shape: _roundedShape,
            actions: [
              TextButton(
                onPressed: () {
                  onClick?.call();
                  Navigator.pop(context);
                },
                child: Text(positiveText),
              )
            ],
          );
        },
      );
    }

    _alertDialogBuilder();
  }

  static void showCancelDialog(
    context, {
    String title = 'App Alert',
    required String message,
    String negLabel = 'Cancel',
    String positiveLabel = 'Ok',
    Function? onClick,
  }) {
    Future<void> _alertDialogBuilder() async {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(message),
            ),
            shape: _roundedShape,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(negLabel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onClick?.call();
                },
                child: Text(positiveLabel),
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
          shape: _roundedShape,
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
