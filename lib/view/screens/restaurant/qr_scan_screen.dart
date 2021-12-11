import 'dart:developer';

import 'package:efood_multivendor/view/screens/restaurant/qr_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return QRView(
      onQRViewCreated: (result) async {
        if (result != null) {
          result.pauseCamera();
        }
        var event = await result.scannedDataStream.first;
        bool validURL = Uri.parse(event.code).host == '' ? false : true;
        log(validURL.toString() + event.code, name: "res");
        if (validURL) {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QrResult(url: event.code)));
        }
      },
      key: qrKey,
    );
  }
}
