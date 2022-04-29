import 'package:flutter/material.dart';

import 'body.dart';

class NotificationsPage extends StatelessWidget {
  final String symbolName;

  NotificationsPage(this.symbolName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symbolName),
      ),
      body: Body(symbolName),
    );
  }
}
