import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Service2Screen extends StatefulWidget {
  const Service2Screen({Key? key}) : super(key: key);

  @override
  _Service2ScreenState createState() => _Service2ScreenState();
}

class _Service2ScreenState extends State<Service2Screen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Builder(builder: (BuildContext context) {
        return WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (progress) => print(progress),
          initialUrl: 'http://194.32.76.82:8751/services/automat/',
        );
      })),
    );
  }
}
