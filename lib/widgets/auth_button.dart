import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final bool isApiInProgress;
  final VoidCallback onPressed;
  final String label;

  AuthButton({
    this.isApiInProgress = false,
    this.onPressed,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.grey[900].withOpacity(0.7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            isApiInProgress ? 'Please wait ...' : this.label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          if (!isApiInProgress)
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 16,
            ),
          if (isApiInProgress)
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              height: 15,
              width: 15,
            ),
        ],
      ),
    );
  }
}
