import 'package:barcode_scan/model/scan_result.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  var qrText = '';

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('This is the result of scan: $qrText'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            controller?.pauseCamera();
                          },
                          child: Text('pause', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          onPressed: () {
                            controller?.resumeCamera();
                          },
                          child: Text('resume', style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // String _barcode = "";

  // @override
  // initState() {
  //   super.initState();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Padding(
  //     padding: const EdgeInsets.only(top: 98.0),
  //     child: Center(
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             child: RaisedButton(
  //               onPressed: barcodeScanning,
  //               child: Text(
  //                 "Capture Image",
  //                 style: TextStyle(fontSize: 20, color: Colors.white),
  //               ),
  //               color: Theme.of(context).accentColor,
  //             ),
  //             padding: const EdgeInsets.all(10.0),
  //             margin: EdgeInsets.all(10),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //           ),
  //           Text(
  //             "Scanned Barcode Number:",
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           Text(
  //             _barcode,
  //             style: TextStyle(fontSize: 25, color: Theme.of(context).accentColor, fontWeight: FontWeight.w600),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  // Future barcodeScanning() async {
  //   try {
  //     ScanResult barcode = await BarcodeScanner.scan();
  //     print(this._barcode);

  //     setState(() => this._barcode = barcode.rawContent);
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.cameraAccessDenied) {
  //       setState(() {
  //         this._barcode = 'No camera permission!';
  //       });
  //     } else {
  //       setState(() => this._barcode = 'Unknown error: $e');
  //     }
  //   } on FormatException {
  //     setState(() => this._barcode = 'Nothing captured.');
  //   } catch (e) {
  //     setState(() => this._barcode = 'Unknown error: $e');
  //   }
  // }
}
