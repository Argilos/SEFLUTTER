// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:qr_flutter/qr_flutter.dart';



// class QRPage extends StatelessWidget{
//   final Random _random = Random();

//   String _generateRandomString(){
//     const String chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    
//     List<int> codeUnits =
//       List.generate(10, (index) => chars.codeUnitAt(_random.nextInt(chars.length)));

//   return String.fromCharCodes(codeUnits);
    
//   }

//   @override
//   Widget build(BuildContext context){
//     String randomString = _generateRandomString();
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('QR code for entering gym'),
//       ),
//       ),
//       body: Container(
//         color:Colors.white,
//       child: Center(
//         child: QrImage(
//           data: randomString,
//           version: QrVersions.auto,
//           size: 200.0,
//           backgroundColor: Colors.white,
//         ),
//       ),
//     ),
//     );
    
//   }
// }