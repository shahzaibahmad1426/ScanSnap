import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String qrResult = 'Scanned data will appear here';
  Future<void> scanQR()async{
    try {
        final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
        if(!mounted) {
          return setState(() {
          qrResult = qrcode.toString();
        });
        }
    }on PlatformException{
      qrResult = 'Failed to Read the QR Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'ScanSnap',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Text("$qrResult",style: const TextStyle(color: Colors.black),),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: scanQR, child: const Text('Scan the QR Code'))
            ],
        ),
      ),
    );
  }
}
