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





class BarcodeGenerator {
  static Widget generateBarcodeWidget(String barcodeValue) {
    return SfBarcodeGenerator(
      value: barcodeValue,

    );
  }
}

class barcode_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget barcodeWidget = BarcodeGenerator.generateBarcodeWidget('1234567890');

    return Scaffold(
      appBar: AppBar(title: Text('Barcode Generator')),
      body: Center(
        child: Container(
          height: 150,
          width: 300,
          child: barcodeWidget,
        ),
      ),
    );
  }
}



