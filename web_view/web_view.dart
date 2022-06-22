
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

final String url ;
WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,


          ),
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
