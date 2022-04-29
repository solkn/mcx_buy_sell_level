import 'package:flutter/material.dart';

import '../../../others/constants.dart';
import '../notifications/notifications_page.dart';

class SymbolsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            leading: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                    'assets/images/${symbolsList[index].image}.png')),
            title: Text(symbolsList[index].name),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            onTap: () =>
                _onNavigateToNotifications(context, symbolsList[index].name),
          ),
        );
      },
      itemCount: symbolsList.length,
    );
  }

  void _onNavigateToNotifications(BuildContext context, String symbolName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsPage(symbolName),
      ),
    );
  }
}
