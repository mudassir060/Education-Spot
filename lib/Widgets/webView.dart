import 'dart:io';
import 'package:education_spot/constants/style.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Web View"),    backgroundColor: primaryColor,
      ),
      body: WebView(
                initialUrl: widget.url,
      ),
    );
  }
}
