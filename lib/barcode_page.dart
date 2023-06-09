import 'package:flutter/material.dart';
import 'dart:math';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BarcodeGenerator {
  static Widget generateBarcodeWidget(String clientGymID) {
    return Container(
      width: 300,
      height: 150,
      child: SfBarcodeGenerator(
        value: clientGymID,
      ),
    );
  }
}

class BarcodePage extends StatelessWidget {
  final String clientGymID;

  BarcodePage({required this.clientGymID});

  factory BarcodePage.generate() {
    String generatedGymID = generateRandomGymID();
    return BarcodePage(clientGymID: generatedGymID);
  }

  @override
  Widget build(BuildContext context) {
    Widget barcodeWidget = BarcodeGenerator.generateBarcodeWidget(clientGymID);
    return Scaffold(
      appBar: AppBar(title: Text('Barcode Generator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Client Gym ID: $clientGymID'),
            barcodeWidget,
          ],
        ),
      ),
    );
  }

  static String generateRandomGymID() {
    Random random = Random();
    int randomNumber = random.nextInt(90000000) + 10000000;
    return randomNumber.toString();
  }
}
