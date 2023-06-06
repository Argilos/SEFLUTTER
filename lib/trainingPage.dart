import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class TrainingPlansPage extends StatefulWidget{
  const TrainingPlansPage({Key? key}) : super(key: key);

  @override
  _TrainingPlansPageState createState() => _TrainingPlansPageState();
}

class _TrainingPlansPageState extends State<TrainingPlansPage> {
  late String _downloadUrl;
  late String _fileName;


  Future<void> _downloadFile() async{
    final directory = await getExternalCacheDirectories();
    final file = File('${directory!.first.path}/$_fileName');
    final response = await http.get(Uri.parse(_downloadUrl));

    await file.writeAsBytes(response.bodyBytes);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File downloaded sucessfully')),

    );
  }

  @override
  Widget build(BuildContext context){
    _downloadUrl = 'https://www.mediafire.com/file/5my9ebafdt3avcn/test.pdf/file';
    _fileName = 'trainingPlan.pdf';

    return Scaffold(
      appBar: AppBar(
        title: Text('Training plans'),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Upper body plan',
            style: TextStyle(fontSize: 24.0, 
            fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text('You can download this plan for free',
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
              ),

               SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _downloadFile();
              },
              child: Text('Download'),
            ),
          ],
        ),
      ),
      
      
      
      );
  }
}
