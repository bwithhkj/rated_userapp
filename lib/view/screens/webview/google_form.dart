import 'dart:io';
import 'package:efood_multivendor/view/base/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleForm extends StatefulWidget {

  final String googleFormUrl;
  GoogleForm({@required this.googleFormUrl});

  @override
  GoogleFormState createState() => GoogleFormState();
}

class GoogleFormState extends State<GoogleForm> {
  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey Form', showCart: false),
      body:WebView(
        initialUrl: widget.googleFormUrl,
      ),
    );
  }
}