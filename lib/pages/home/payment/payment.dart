import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'constants.dart';

class PaytmPayment extends StatefulWidget {
  final String amount;

  PaytmPayment({this.amount});

  @override
  _PaytmPaymentState createState() => _PaytmPaymentState();
}

class _PaytmPaymentState extends State<PaytmPayment> {
  WebViewController webViewController;

  String loadHTML() {
    return "<html> <body onload='document.f.submit();'> <form id='f' name='f' method='post' action='$PAYMENT_URL'><input type='hidden' name='orderID' value='ORDER_${DateTime.now().millisecondsSinceEpoch}'/>" +
        "<input  type='hidden' name='custID' value='USER_${ORDER_DATA['custID']}' />" +
        "<input  type='hidden' name='amount' value='${widget.amount}' />" +
        "<input type='hidden' name='custEmail' value='${ORDER_DATA['custEmail']}' />" +
        "<input type='hidden' name='custPhone' value='${ORDER_DATA['custPhone']}' />" +
        "</form></body> </html>";
  }

  @override
  void dispose() {
    webViewController = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: WebView(
        debuggingEnabled: false,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webViewController = controller;

          webViewController.loadUrl(
              Uri.dataFromString(loadHTML(), mimeType: 'text/html').toString());
        },
      ),
    )));
  }
}
