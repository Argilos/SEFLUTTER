import 'package:flutter/material.dart';



import 'package:syncfusion_flutter_barcodes/barcodes.dart';


// class BarcodeGenerator {
//   static Widget generateBarcodeWidget() {
//     return SfBarcodeGenerator(
//       value: '1234567890', // Provide the barcode value here
//       symbology: QRCode(),
//     );
//   }
// }

// class barcode_page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget barcodeWidget = BarcodeGenerator.generateBarcodeWidget();

//     return Scaffold(
//       appBar: AppBar(title: Text('Barcode Generator')),
//       body: Center(
//         child: barcodeWidget,
//       ),
//     );
//   }
// }

import 'profile.dart';
import 'dart:math';


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

  const BarcodePage({required this.clientGymID});

  factory BarcodePage.generate() {
    String generatedGymID = generateRandomGymID();
    return BarcodePage(clientGymID: generatedGymID);
  }

  @override
  Widget build(BuildContext context){
    Widget barcodeWidget = BarcodeGenerator.generateBarcodeWidget(clientGymID); // Pass the clientGymID to generate the barcode
    return Scaffold(
      appBar: AppBar(title: Text('Barcode Generator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Client Gym ID: $clientGymID'),
            barcodeWidget,
          ],
        )
      ),
    );
  }

  static String generateRandomGymID() {
    Random random = Random();
    int randomNumber = random.nextInt(90000000) + 10000000;
    return randomNumber.toString();
  }
}