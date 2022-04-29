import 'package:flutter/material.dart';

void showConfirmationDialog(
  BuildContext context, {
  String title,
  String message,
  VoidCallback onYes,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  onYes();
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
          ],
        );
      });
}

void showInfoDialog(
  BuildContext context, {
  String title,
  String message,
  VoidCallback onOk,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (onOk != null) onOk();
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
          ],
        );
      });
}

void showProgressDialog(BuildContext context,
    {String message = 'Please wait ...'}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 32),
              Text(message),
            ],
          ),
        );
      });
}
