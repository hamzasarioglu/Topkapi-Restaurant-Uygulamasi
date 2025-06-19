// ignore_for_file: use_build_context_synchronously
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoran_app/models/restoran_model.dart';
import 'package:restoran_app/pages/anasayfa_page.dart';
import 'package:restoran_app/pages/restoran_detay.dart';

import '../snackbar_show.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  ScanResult? scanResult;
  final double _aspectTolerance = 0.00;
  final bool _useAutoFocus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnaSayfa()),
            );
          },
          icon: Icon(Icons.food_bank),
        ),
        centerTitle: true,
        title: Text(
          "Topkapı Restaurant'a Hoşgeldiniz!",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.qr_code, size: 250),
          Center(
            child: ElevatedButton(
              onPressed: _scan,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF4CAF50),
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 6,
                ),
                child: Text(
                  "QR Okut!",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _scan() async {
    try {
      String masaId = "";

      ScanResult scanResult = await BarcodeScanner.scan(options: scanOption());
      setState(() {
        masaId = scanResult.rawContent;
      });
      if (masaId.isEmpty) {
        snackBarGoster(context, "QR cant read it");
      } else {
        getTable(masaId);
      }
    } on PlatformException catch (e) {
      snackBarGoster(
        context,
        e.code == BarcodeScanner.cameraAccessDenied
            ? 'Camera cant access!'
            : 'Unknown error: $e',
      );
    }
  }

  ScanOptions scanOption() {
    return ScanOptions(
      android: AndroidOptions(
        aspectTolerance: _aspectTolerance,
        useAutoFocus: _useAutoFocus,
      ),
    );
  }

  Future getTable(String tableId) async {
    try {
      switch (tableId) {
        case "topkapi-masa-1":
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestoranDetay(restoran: restoranlar[0]),
            ),
          );
          break;
        default:
          snackBarGoster(context, "Bu QR kodu tanınmıyor!");
      }
    } catch (e) {
      snackBarGoster(context, "Error Code : \n$e");
    }
  }
}
