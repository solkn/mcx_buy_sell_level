import 'package:flutter/material.dart';

class ConnectionInformation extends StatelessWidget {
  final bool showError;
  final VoidCallback onRetry;

  ConnectionInformation({this.showError = false, @required this.onRetry});

  @override
  Widget build(BuildContext context) {
    if (this.showError) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Internet connection fail'),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 0,
            ),
            onPressed: this.onRetry,
            child: Text(
              'Retry',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
