import 'dart:async';
import 'dart:io';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:mcx_buy_sell_levels/pages/home/payment/payment.dart';
import './subscription_item.dart';
import '../../../services/api_service.dart';
import '../../../utils/dialogs.dart';
import '../../../utils/fade_route.dart';
import '../../../utils/in_app_helper.dart';
import '../../../utils/scaffold.dart';
import '../webview/webview_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with AfterLayoutMixin<Body> {
  StreamSubscription purchaseUpdatesSubscription;
  List<ProductDetails> iosPackages;
  final packages = [
    {
      'id': 'mcxbslevels_pkg_30_days',
      'image': 'pkg_1',
      'title': '1 Month Subscription',
      'isPopular': true,
      'price': Platform.isIOS ? '' : 'INR: 199',
    },
    {
      'id': 'mcxbslevels_pkg_90_days',
      'image': 'pkg_2',
      'title': '3 Months Subscription',
      'price': Platform.isIOS ? '' : 'INR: 499',
    },
    {
      'id': 'mcxbslevels_pkg_180_days',
      'image': 'pkg_3',
      'title': '6 Months Subscription',
      'price': Platform.isIOS ? '' : 'INR: 799',
    },
    {
      'id': 'mcxbslevels_pkg_365_days',
      'image': 'pkg_4',
      'title': '1 Year Subscription',
      'price': Platform.isIOS ? '' : 'INR: 999',
    },
  ];

  @override
  void initState() {
    purchaseUpdatesSubscription = inAppHelper.purchaseUpdates.listen(
      (list) async {
        if (list.isEmpty) return;
        print("purchase updated");
        if (list.first.status == PurchaseStatus.pending)
          showProgressDialog(context);
        else
          Navigator.pop(context);

        if (list.first.status == PurchaseStatus.purchased) {
          await inAppHelper.consumePurchase(list.first);
          try {
            await apiService.increaseSubscription(
                list.first.productID.replaceAll('mcxbslevels_', ''));
            Navigator.pop(context, true);
          } catch (e) {}
        }
      },
    );
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (Platform.isIOS) {
      _getIOSPackages();
    }
  }

  @override
  void dispose() {
    if (purchaseUpdatesSubscription != null)
      purchaseUpdatesSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < packages.length; i++)
          SubscriptionItem(
            packages[i]['image'],
            packages[i]['title'],
            packages[i]['price'],
            isPopular: packages[i]['isPopular'] == true,
            //onTap: () => _onSubscribe(context, packages[i]['id']),
            onTap:  (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaytmPayment(amount: "10000")));
        },
          ),
      ],
    );
  }

  void _onSubscribe(BuildContext context, String packageId) {
    if (Platform.isIOS)
      _onSubscribeIos(context, packageId);
    else
      _onSubscribeAndroid(context, packageId);
  }

  void _onSubscribeAndroid(BuildContext context, String packageId) async {
    try {
      showProgressDialog(context);
      final longUrl = await apiService.requestInstamojoPaymentLink(packageId);
      Navigator.pop(context);
      final url = await Navigator.push(
          context, FadeRoute(page: WebviewPage(longUrl, 'Instamojo')));
      if (url != null && url.contains('Credit')) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      Navigator.pop(context);
      showScaffoldMessage(context, e.message);
    }
  }

  void _getIOSPackages() async {
    final list = await inAppHelper.getProdcutDetails();
    list.forEach((product) {
      final pkg = packages.firstWhere((value) => value['id'] == product.id,
          orElse: () => null);
      if (pkg != null) {
        pkg['price'] = product.price;
      }
    });
    iosPackages = list;
    setState(() {});
  }

  void _onSubscribeIos(BuildContext context, String packageId) async {
    if (iosPackages == null) return;
    final pkg = iosPackages.firstWhere((value) => value.id == packageId,
        orElse: () => null);
    if (pkg != null) inAppHelper.buy(pkg);
  }
}
