import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QrResult extends StatefulWidget {
  QrResult({Key key, @required this.url}) : super(key: key);
  final String url;

  @override
  _QrResultState createState() => _QrResultState();
}

class _QrResultState extends State<QrResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
