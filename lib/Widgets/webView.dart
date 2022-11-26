import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatefulWidget {
  final String url;

  const webView({super.key, required this.url});

  @override
  webViewState createState() => webViewState();
}

class webViewState extends State<webView> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.url}");
    return WebView(
      initialUrl: widget.url,
    );
  }
}