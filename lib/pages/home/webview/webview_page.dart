import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String url;
  final String title;

  WebviewPage(this.url, this.title);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  StreamSubscription flutterWebViewSubscpriton;
  //final webview = WebView();
  
  @override
  void initState() {
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();

    if(Platform.isAndroid){
      WebView.platform = AndroidWebView();
    }

    super.initState();

    // this.flutterWebViewSubscpriton = webview.onUrlChanged.listen(
    //   (url) {
    //     if (url.startsWith('https://www.mcxsuregain.com')) {
    //       Navigator.pop<String>(context, url);
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // return WebView(
    //   url: widget.url,
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //     leading: IconButton(
    //       icon: Icon(Icons.close),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.mcxsuregain.com',
      ),

    );
  }

  @override
  void dispose() {
    flutterWebViewSubscpriton.cancel();
    super.dispose();
  }
}
