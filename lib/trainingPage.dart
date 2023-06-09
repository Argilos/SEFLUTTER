import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrainingPlanPage extends StatelessWidget {
  final String downloadUrl;

  const TrainingPlanPage({required this.downloadUrl});

  Future<void> _launchURL() async {
    if (await canLaunch(downloadUrl)) {
      await launch(downloadUrl);
    } else {
      throw 'Could not launch $downloadUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Plan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Training Plan Page',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Download'),
            ),
          ],
        ),
      ),
    );
  }
}
