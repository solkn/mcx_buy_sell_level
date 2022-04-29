import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/data/notification_data.dart';
import '../../../services/api_service.dart';
import '../../../utils/firebase_messaging.dart';
import '../../../widgets/connection_information.dart';
import '../subscription_expiry/subscription_expiry.dart';
import 'list_item.dart';

class Body extends StatefulWidget {
  final String symbolName;

  Body(this.symbolName);

  @override
  _BodyState createState() => _BodyState();
}


class _BodyState extends State<Body> with AfterLayoutMixin<Body> {
  List<NotificationData> notifications;
  StreamSubscription onMessageSubscription;
  var hasError = false;

  @override
  void initState() {
    super.initState();
    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == AppLifecycleState.resumed.toString()) {
        _initNotifications();
      }
      return Future.delayed(Duration());
    });
    _initNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubscriptionExpiry(),
        Expanded(
          child: _getBody(),
        ),
      ],
    );
  }

  Widget _getBody() {
    if (notifications == null || hasError) {
      return Center(
        child: ConnectionInformation(
          showError: hasError,
          onRetry: () {
            _initNotifications();
          },
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => ListItem(notifications[index]),
        itemCount: notifications.length,
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    firebaseMessaging.onMessage.listen((remoteMsg) {
      _initNotifications();
    });
  }

  @override
  void dispose() {
    if (onMessageSubscription != null) onMessageSubscription.cancel();
    SystemChannels.lifecycle.setMessageHandler(null);
    super.dispose();
  }

  void _initNotifications() async {
    if (hasError) {
      hasError = false;
      setState(() {});
    }
    try {
      notifications = (await apiService.getNotifications())
          .where((notification) =>
              notification.symbol == widget.symbolName.replaceAll(' ', ''))
          .toList();
    } catch (e) {
      hasError = true;
    }
    setState(() {});
  }
}
