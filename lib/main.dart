import 'package:flutter/material.dart';
import 'package:scansnap/qr_code_generator.dart';
import 'package:scansnap/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScanSnap',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ElevatedButton(
              onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrCodeScanner()));
                });
              },
              child: const Text('Scan the QR Code'),
            ),
            const SizedBox(height: 40,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrCodeGenerator()));
                });
              },
              child: const Text('Scan the QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
