import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import '../../others/enums.dart';
import '../../services/local_storage_service.dart';
import '../../state_managers/bloc/drawer_bloc.dart';
import '../../utils/dialogs.dart';
import '../../utils/fade_route.dart';
import '../../utils/firebase_messaging.dart';
import '../../utils/notification_utils.dart';
import '../auth/login/login_page.dart';
import 'widgets/drawer_child.dart';
import 'symbols/symbols_container.dart';
import 'my_account/my_account_container.dart';
import 'subscriptions/subscriptions_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  var selectedItem = DrawerItem.symbols;

  // ignore: cancel_subscriptions
  StreamSubscription onMessageSubscription;

  // ignore: cancel_subscriptions
  StreamSubscription onDrawerItemSelectedSubscription;

  @override
  void initState() {
    firebaseMessaging.requestNotificationPermissions();
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    onDrawerItemSelectedSubscription = DrawerBloc.of(context)
        .onDrawerItemSelected
        .listen(_onDrawerItemSelected);

    firebaseMessaging.onMessage.listen((remoteMsg) {
      NotificationUtils.showNotification(
        context,
        remoteMsg.title,
        remoteMsg.body,
      );
    }
    );
  }

  @override
  void dispose() {
    if (this.onMessageSubscription != null) {
      this.onMessageSubscription.cancel();
    }
    if (this.onDrawerItemSelectedSubscription != null) {
      this.onDrawerItemSelectedSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),
      drawer: Drawer(
        child: DrawerChild(
          selectedItem: selectedItem,
        ),
      ),
      body: _getBody(),
    );
  }

  void _onDrawerItemSelected(DrawerItem item) {
    setState(() {
      if (item != DrawerItem.logout &&
          item != DrawerItem.share &&
          item != DrawerItem.subscriptions) selectedItem = item;
    });
    if (item == DrawerItem.logout) {
      _onLogout();
    } else if (item == DrawerItem.share) {
      WcFlutterShare.share(
          sharePopupTitle: 'Share MCX Buy Sell Levels',
          mimeType: 'text/plain',
          text:
              'Download MCX Buy Sell Levels IOS or Android app now.\n\nhttp://hyperurl.co/mcx_buy_sell_levels');
    } else if (item == DrawerItem.subscriptions) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubscriptionsPage(),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  Widget _getBody() {
    switch (selectedItem) {
      case DrawerItem.symbols:
        return SymbolsContainer();
      case DrawerItem.myAccount:
        return MyAccountContainer();
      default:
        return Center(
          child: Text('Under development'),
        );
    }
  }

  String _getTitle() {
    switch (selectedItem) {
      case DrawerItem.symbols:
        return 'Symbols';
      case DrawerItem.myAccount:
        return 'My Account';
      default:
        return '';
    }
  }

  void _onLogout() {
    showConfirmationDialog(context, title: 'Logout!', message: 'Are you sure?',
        onYes: () async {
      await localStorageService.clear();
      firebaseMessaging.deleteInstanceID();
      _navigationToLogin();
    });
  }

  void _navigationToLogin() {
    Navigator.pushAndRemoveUntil(
        context, FadeRoute(page: LoginPage()), (_) => false);
  }
}
